class Appraisal < ActiveRecord::Base
  before_save :sanitize_appraisal_info, if: :active?
  before_validation :validate_appraisal_info
  after_create :initialize_classification

  has_paper_trail :only => [:status, :assigned_to, :assigned_on], :skip => [:appraisal_info]

  has_one :payout, :dependent => :destroy
  has_one :coupon_usage, :dependent => :nullify

  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy
  has_many :tickets

  has_many :appraisal_datums , :dependent => :destroy  , :class_name => "AppraisalDatum"
  has_one :classification
  has_one :payment

  has_many :partner_informations

  belongs_to :assigned_to, :class_name => 'User' , :foreign_key => "assigned_to"
  belongs_to :owned_by,    :class_name => 'User' , :foreign_key => "created_by"

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :appraisal_datums, :allow_destroy => true
  accepts_nested_attributes_for :classification, :allow_destroy => true
  accepts_nested_attributes_for :payment, :allow_destroy => true

  validates_presence_of :created_by, if: :active_or_general?
  validates_presence_of :name, :title, :insurance_location, if: :active_or_general?
  validates :selected_plan, :presence => { :message => "Please select a plan to continue" }, if: :active?
  validate :validate_appraisal_requirements, if: :active?
  validate :validate_appraiser_referral, if: :active_or_general?

  serialize :appraisal_info, AppraisalInfo

  attr_accessible :appraiser_referral, :allow_share, :created_by, :selected_plan, :name, :photos_attributes, :appraiser_number, :appraisal_info, :status, :appraisal_type, :title, :is_downloaded
  attr_accessible :classification_attributes, :payment_attributes, :step, :rejection_reason
  attr_accessible :insurance_claim, :insurance_prior, :insurance_location
  acts_as_commentable

  scope :visible, -> {where("status != ?", EActivityValueHidden)}
  scope :processing, -> {where("status = ?", EActivityValueClaimed)}
  scope :complete, -> {where("status = ?", EActivityValueFinalized)}

  # Returns how much time it took the appraiser to complete the appraisal (can return in seconds (s), minutes(m), hours(h), or days(d))
  def completion_time(format = "s")
    begin
      # claimed_on = (get_date_for_status_change(EActivityValuePayed, EActivityValueClaimed)).to_i
      claimed_on = get_claimed_on
      completed_on = (get_date_for_status_change(EActivityValueClaimed, EActivityValueFinalized)).to_i

      duration = (claimed_on == 0 || completed_on == 0) ? 0 : (completed_on - claimed_on)

      case format
      when 'm'
        (duration/60).to_i
      when 'h'
        (duration/3600).to_i
      when 'd'
        (duration/86400).to_i
      else
        duration
      end
    rescue
      return 0
    end
  end

  def get_claimed_on
    reject_to_process = self.versions.select {|x| YAML.load(x.object_changes)["status"] == [EActivityValueReviewRejection, EActivityValueClaimed] }
    unclaim_to_process = self.versions.select {|x| YAML.load(x.object_changes)["status"] == [EActivityValuePayed, EActivityValueClaimed] }

    # If no rejected
    if reject_to_process.blank?
      return unclaim_to_process.last.created_at.to_i
    elsif reject_to_process.length >= unclaim_to_process.length
      return reject_to_process.last.created_at.to_i
    elsif reject_to_process.length < unclaim_to_process.length
      return unclaim_to_process.last.created_at.to_i
    end
  end

  # TODO See how this works if an appraiser claims an item and then returns it to the pool without finishing the appraisal
  def get_date_for_status_change(from_status, to_status)
    selected_version = self.versions.select {|x| YAML.load(x.object_changes)["status"] == [from_status, to_status] }
    !selected_version.empty? ? selected_version.last.created_at : 0
  end

  def paid_amount
    if self.status == EActivityValueFinalized
      Compensation.get_paid_amount(self.selected_plan,completion_time("h"))
    end
  end

  def payed?
    !self.payment.nil? && !self.payment.is_charged && !self.payment.auth_code.nil?
  end

  def pay!
    self.status = EActivityValuePayed
    self.save
  end

  def pay_and_notify!
    self.pay!
    if self.appraiser_referral.blank?
      User.notify_appraisers_of_new_appraisal(self) if (Rails.env == 'development' || Rails.env == 'production')
    else
      User.notify_referral_of_new_appraisal(self)
    end
  end

  def default_photo
    self.photos.find_by_default(true) || self.photos.first
  end

  def is_short?
    [EAAppraisalTypeShortRestricted, EAAppraisalTypeShortForSelling, EAAppraisalTypeShortRestrictedPair, EAAppraisalTypeShortForSellingPair].include?(self.selected_plan)
  end

  def is_long?
    [EAAppraisalTypeLongRestricted, EAAppraisalTypeLongForSelling, EAAppraisalTypeLongRestrictedPair, EAAppraisalTypeLongForSellingPair].include?(self.selected_plan)
  end

  def is_pair?
    [EAAppraisalTypeLongRestrictedPair, EAAppraisalTypeLongForSellingPair, EAAppraisalTypeShortRestrictedPair, EAAppraisalTypeShortForSellingPair].include?(self.selected_plan)
  end

  def suggest_for_rejection(params)
    self.status = EActivityValueReviewRejection
    self.rejection_reason = params[:rejection_reason]
    self.save
    UserMailer.notify_admin_of_suggested_rejection({appraisal: self, rejection_reason: params[:rejection_reason]}).deliver if (Rails.env == 'development' || Rails.env == 'production')
  end

  def reject(comments)
    comments ||= "No reason for rejection was given"
    self.status = EActivityValueRejected
    self.rejection_reason = "" unless self.rejection_reason
    self.rejection_reason = self.rejection_reason + " ADMIN COMMENTS: " + comments
    self.save
    UserMailer.notify_user_of_rejection(self,comments).deliver if (Rails.env == 'development' || Rails.env == 'production')
  end

  def return_to_claimed_status
    self.status = EActivityValueClaimed
    self.save
  end

  def return_to_queue
    unless self.status == EActivityValuePayed
      self.status = EActivityValuePayed
      self.appraisal_info.additional_ea = ""
      self.appraisal_info.appraiser_comments = ""
      self.appraisal_info.replacement_cost_min = ""
      self.appraisal_info.replacement_cost_max = ""
      self.appraisal_info.fair_market_value_min = ""
      self.appraisal_info.fair_market_value_max = ""
    end
    self.appraiser_referral = ""
    self.assigned_to = nil
    self.save 
  end

  def assign_to_appraiser_id(appraiser)
    unless self.status == EActivityValuePayed
      self.status = EActivityValuePayed
      self.appraisal_info.additional_ea = ""
      self.appraisal_info.appraiser_comments = ""
      self.appraisal_info.replacement_cost_min = ""
      self.appraisal_info.replacement_cost_max = ""
      self.appraisal_info.fair_market_value_min = ""
      self.appraisal_info.fair_market_value_max = ""
    end
    self.appraiser_referral = appraiser.referral_id
    self.assigned_to = appraiser
    self.assigned_on = Time.now
    self.save
    UserMailer.notify_appraiser_for_new_assign(appraiser.id).deliver
  end

  def claim!(params)
    return false if self.status != EActivityValuePayed

    self.assigned_to = params[:appraiser] #current_user
    self.assigned_on = Time.now
    self.status = EActivityValueClaimed
    self.save
  end

  def finalize!
    self.update_attributes(status: EActivityValueFinalized)
  end

  def retrieve_comments
    self.root_comments.order('created_at ASC')
  end

  def active?
    step == 'active'
  end

  def merge_appraisal_info(params)
    params[:appraisal][:appraisal_info] = Hash.new if params[:appraisal][:appraisal_info].nil?
    current_appraisal_info = self.appraisal_info.instance_values
    current_appraisal_info.merge!(AppraisalInfo.new(params[:appraisal][:appraisal_info]).instance_values)
    return AppraisalInfo.new(current_appraisal_info)
  end

  def category
    self.classification.category
  end

  def payout_amount
    self.payout.nil? ? 0 : self.payout.amount
  end

  def is_insurance?
    self.insurance_claim || self.insurance_prior
  end

  private
  def sanitize_appraisal_info
    self.appraisal_info.sanitize
  end

  def active_or_general?
    step.to_s.include?('general') || active?
  end

  def validate_appraisal_requirements
    case self.status
    when EActivityValueFinalized
      if self.appraisal_info.fair_market_value_min.blank?
        errors.add(:fair_market_value_min, "can't be blank")
      end
      if self.appraisal_info.fair_market_value_max.blank?
        errors.add(:fair_market_value_max, "can't be blank")
      end
      if self.appraisal_info.replacement_cost_min.blank?
        errors.add(:replacement_cost_min, "can't be blank")
      end
      if self.appraisal_info.replacement_cost_max.blank?
        errors.add(:replacement_cost_max, "can't be blank")
      end
      if self.appraisal_info.appraiser_comments.blank?
        errors.add(:appraiser_comments, "can't be blank")
      end
    when EActivityValueClaimed
      if self.appraisal_info.appraiser_comments.blank?
        errors.add(:appraiser_comments, "can't be blank")
      end
      if (self.appraisal_info.appraiser_comments.length <= 100 )
        errors.add(:appraiser_comments, "minimum length of 100 words")
      end
    end  
  end

  def validate_appraisal_info
    unless self.appraisal_info.valid?(step.to_s.to_sym)
      errors.add :appraisal_info, appraisal_info.errors
    end
  end

  def validate_appraiser_referral
    if !self.appraiser_referral.blank? && Appraiser.find_by_referral_id(self.appraiser_referral).nil?
      errors.add(:appraiser_referral, "is invalid")
    end
  end

  def initialize_classification
    Classification.create(appraisal_id: self.id)
  end
end
