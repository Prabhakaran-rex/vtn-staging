class User < ActiveRecord::Base
  include ActiveRecord::CallbacksAwareSti
  attr_accessible :type

  rolify
  has_many :appraisals
  has_many :appraisal_activities
  # TODO Photos could be removed from the User model
  has_many :photos, :dependent => :destroy
  has_many :payments
  has_many :tags
  has_many :tickets

  belongs_to :partner_pricing
# STI Migration
  attr_accessible :type
  has_one :address
  accepts_nested_attributes_for :address
  after_create :create_address
  attr_accessible :address_attributes
  validates_inclusion_of :type, :in => ["Appraiser", "Customer"]
# END STI Migration

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h
  after_update :crop_avatar
  #after_update :generate_token

  accepts_nested_attributes_for :photos, :allow_destroy => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :secure_validatable, :confirmable, :authentication_keys => [:email]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
    :photos_attributes, :notify_by_sms, :notify_by_email, :next_notification_interval_in_minutes,
    :payment_method, :uspap, :name, :agree_to_tos, :role, :access_token, :login, :status, :avatar, 
    :avatar_cache, :remove_avatar, :website, :paypal_email, :is_partner, :partner_pricing_id,
    :negotiated_cost, :payment_term, :secondary_contact_name, :secondary_contact_email

  attr_accessible :crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h
  attr_accessible :crop_x, :crop_y, :crop_w, :crop_h

  attr_accessible :agree_to_provider_agreement, :agree_to_code_of_ethics
  validates :agree_to_provider_agreement, :agree_to_code_of_ethics, :acceptance => true, :on => :create, :if => :is_appraiser?
  validates :negotiated_cost , numericality: { greater_than_or_equal_to: 0}

  # Used for appraiser signup
  attr_accessor :access_token

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Set requirement for signup
  validates :agree_to_tos, :acceptance => true, :on => :create
  validates_presence_of :name, :email
  validates_presence_of :password, :password_confirmation, :on => :create
  validates_presence_of :email, :on => :create

  def notify_creator_of_appraisal_update( appraisal )
    UserMailer.notify_creator_of_appraisal_update( appraisal ).deliver
  end

  def self.notify_appraisers_of_new_appraisal( appraisal )
    appraiser_ids = Skill.select("appraiser_id").where("category_id = ?", appraisal.classification.category_id).pluck(:appraiser_id)
    appraisers = Appraiser.where("id in (?) and status = ? ",appraiser_ids, EAUserStatusConfirmed)
    appraisers.each_with_index do |appraiser, index|
      UserMailer.delay.notify_appraiser_of_new_appraisal( appraiser ,
        appraisal ) if appraiser.notify_by_email && Rails.env != "sandbox"
      unless (phone = PhonyRails.normalize_number(appraiser.address.phone1, :country_code => 'US')).nil?
        User.send_sms({:number => phone, :body => "A New Appraisal is Available in one of your selected categories!"}).delay(run_at: (30*index).seconds.from_now) if appraiser.notify_by_sms
      end
    end
  end

  def self.notify_appraisers_in_category(params)
    appraiser_ids = Skill.select("appraiser_id").where("category_id = ?", params[:category].id).pluck(:appraiser_id)
    appraisers = Appraiser.where("id in (?) and status = ? ",appraiser_ids, EAUserStatusConfirmed)
    appraisers.each do |appraiser|
      UserMailer.delay.notify_appraisers_in_category(appraiser: appraiser , comments: params[:comments], category: params[:category]) if appraiser.notify_by_email && Rails.env != "sandbox"
    end
  end

  def self.notify_referral_of_new_appraisal( appraisal )
    appraiser_ids = Appraiser.find_by_referral_id(appraisal.appraiser_referral).id
    appraisers = Appraiser.where("id in (?) and status = ? ",appraiser_ids, EAUserStatusConfirmed)
    appraisers.each_with_index do |appraiser, index|
      UserMailer.delay.notify_referral_of_new_appraisal( appraiser ,
        appraisal ) if appraiser.notify_by_email && Rails.env != "sandbox"
      unless (phone = PhonyRails.normalize_number(appraiser.address.phone1, :country_code => 'US')).nil?
        User.send_sms({:number => phone, :body => "A New Appraisal is Available in one of your selected categories!"}).delay(run_at: (30*index).seconds.from_now) if appraiser.notify_by_sms
      end
    end
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['raw_info']
    token = access_token['credentials']['token']
    users = User.where("facebook_id=? OR email=?", data['id'], data["email"])

    if user = users.find_by_facebook_id(data['id'])
      user
    else # Create a user with a stub password.
      if user = users.find_by_email(data['email'])
        user
      else
        user = Customer.new(:email => data["email"],
                        :username => data["username"],
                        :password => Devise.friendly_token[0, 20]
        )
        user.skip_confirmation!
        user.role = "customer"
      end
    end
    user.facebook_id = data['id'] unless user.facebook_id
    user.name = data['name']
    user.facebook_token = token
    user.email = data["email"]
  if (!data['location'].nil?)
    user.facebook_location = data['location']['name']
    user.facebook_location_id = data['location']['id']
  end
    user.facebook_gender = data['gender']
    user.facebook_verified = data['verified']
    user.facebook_updated = data['updated_time']
    user.facebook_locale = data['locale']
    user.save
    user
  end
  # Override to allow users to sign up with their username or email
  # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.roles
    %w[admin user appraiser]
  end

  def admin?
    self.role == "admin" || self.role == "superadmin"
  end

  def superadmin?
    self.role == "superadmin"
  end

  def confirmed
    self.status == EAUserStatusConfirmed
  end

  def is_confirmed?
    self.confirmed
  end

  def is_under_review?
    self.status == EAUserStatusReview
  end

  def is_rejected?
    self.status == EAUserStatusRejected
  end

  def is_appraiser?
    self.type.eql?("Appraiser")
  end

  def is_customer?
    self.type.eql?("Customer")
  end

  def crop_avatar
    avatar.recreate_versions! if crop_avatar_x.present?
  end

  def status_as_string
    EAUserStatusHash[self.status.to_s]
  end

  def get_last_step
    self.last_step.nil? ? :personal : self.last_step
  end
  
  def get_user_name
    "Welcome #{self.name.camelize}"
  end

  # TODO This should be moved out of the User model
  def self.send_sms(params)
    Rails.logger.debug "*** delivering sms #{params.to_json}"
    nexmo = Nexmo::Client.new(SMS_API_KEY, SMS_SECRET_KEY)
    nexmo.send_message({:to => params[:number], :from => SMS_NUMBER, :text => params[:body]}) if Rails.env == "production"
  end

  
  private
  def create_address
    y = Address.new(); y.user_id = self.id;
    y.save(:validate => false)
  end
end
