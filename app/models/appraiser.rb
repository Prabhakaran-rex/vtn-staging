class Appraiser < User

  alias_attribute :user_id, :id

  has_many :payouts

  has_one :appraiser_extra
  alias_attribute :appraiser_info, :appraiser_extra
  accepts_nested_attributes_for :appraiser_extra
  after_create :create_appraiser_extra
  after_create :assign_referral_id
  attr_accessible :appraiser_extra_attributes

  has_many :trade_references, :dependent => :destroy
  accepts_nested_attributes_for :trade_references, :allow_destroy => true
  attr_accessible :trade_references_attributes

  has_many :skills, :dependent => :destroy
  accepts_nested_attributes_for :skills, :allow_destroy => true
  attr_accessible :skills_attributes

  # The following is used for cropping & storing the signature image
  mount_uploader :signature, SignatureUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessible :signature, :signature_cache, :remove_signature
  after_update :crop_signature

  def is_appraiser_application_complete
    begin
      !self.name.empty? && self.address.valid? && self.appraiser_extra.valid? && self.skills.count > 0 && self.trade_references.count >= 3 && !self.paypal_email.blank? && self.avatar?  && (self.signature? || !self.appraiser_extra.signature_json.nil?)
    rescue Exception => e
      return false
    end
  end

  def submit_application
    self.status = EAUserStatusReview
    self.save
    notify_admin_of_new_application
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end


  def crop_signature
    signature.recreate_versions! if crop_x.present?
  end

  private

  def notify_admin_of_new_application
    unless Rails.env.eql?("development") || Rails.env.eql?("test")
      message = Message.new(:name => self.name, :email => self.email )
      UserMailer.notify_admin_of_new_application(message).deliver
    end
  end

  def create_appraiser_extra
    y = AppraiserExtra.new(); y.appraiser_id = self.id;
    y.save(:validate => false)
  end

  def assign_referral_id
    self.referral_id = generate_referral_id(8)
    self.save
  end

  def generate_referral_id(size = 6)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
end
