class Appraisal < ActiveRecord::Base
  before_save :sanitize_appraisal_info
  has_paper_trail :only => [:status, :assigned_to, :assigned_on], :skip => [:appraisal_info]

  has_one :payout, :dependent => :destroy
  has_one :coupon_usage, :dependent => :nullify

  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy
  has_many :tickets

  has_many :appraisal_datums , :dependent => :destroy  , :class_name => "AppraisalDatum"
  has_one :classification
  has_one :payment

  belongs_to :assigned_to, :class_name => 'User' , :foreign_key => "assigned_to"
  belongs_to :owned_by,    :class_name => 'User' , :foreign_key => "created_by"

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :appraisal_datums, :allow_destroy => true

  validates_presence_of :created_by
  validates_presence_of :title
  validates :selected_plan, :presence => { :message => "Please select a plan to continue" }

  serialize :appraisal_info, AppraisalInfo

  attr_accessible :allow_share, :selected_plan, :name, :photos_attributes, :appraiser_number, :appraisal_info, :status, :appraisal_type, :title
  acts_as_commentable

  scope :visible, where("status != ?", EActivityValueHidden)
  scope :processing, where("status = ?", EActivityValueClaimed)
  scope :complete, where("status = ?", EActivityValueFinalized)

  # Returns how much time it took the appraiser to complete the appraisal (can return in seconds (s), minutes(m), hours(h), or days(d))
  def completion_time(format = "s")
    begin
      claimed_on = (get_date_for_status_change(EActivityValuePayed, EActivityValueClaimed)).to_i
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
    !self.payment.nil?
  end

  def pay!
    self.status = EActivityValuePayed
    self.save
  end

  def pay_and_notify!
    self.pay!
    User.notify_appraisers_of_new_appraisal(self) if (Rails.env == 'development' || Rails.env == 'production')
  end

  def default_photo
    self.photos.find_by_default(true) || self.photos.first
  end

  def is_short?
    [EAAppraisalTypeShortRestricted, EAAppraisalTypeShortForSelling].include?(self.selected_plan)
  end

  def is_long?
    [EAAppraisalTypeLongRestricted, EAAppraisalTypeLongForSelling].include?(self.selected_plan)
  end

  def suggest_for_rejection
    self.status = EActivityValueReviewRejection
    self.save
    UserMailer.notify_admin_of_suggested_rejection(self).deliver if (Rails.env == 'development' || Rails.env == 'production')
  end

  def reject(comments)
    comments ||= "No reason for rejection was given"
    self.status = EActivityValueRejected
    self.save
    UserMailer.notify_user_of_rejection(self,comments).deliver if (Rails.env == 'development' || Rails.env == 'production')
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

  private
  def sanitize_appraisal_info
    self.appraisal_info.sanitize
  end
end
