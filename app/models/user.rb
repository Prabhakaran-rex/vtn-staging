class User < ActiveRecord::Base
  rolify
  has_many :appraisals
  has_many :appraisal_activities
  # TODO Photos could be removed from the User model
  has_many :photos, :dependent => :destroy
  has_many :payments
  has_many :tags
  has_many :tickets

# STI Migration
  attr_accessible :type
  has_one :address
  accepts_nested_attributes_for :address
  after_create :create_address
  attr_accessible :address_attributes
# END STI Migration

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h
  after_update :crop_avatar

  accepts_nested_attributes_for :photos, :allow_destroy => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
    :photos_attributes, :notify_by_sms, :notify_by_email, :next_notification_interval_in_minutes,
    :payment_method, :uspap, :name, :agree_to_tos, :role, :access_token, :login, :status, :agree_to_code_of_ethics, :avatar, :avatar_cache, :remove_avatar

  # Used for appraiser signup
  attr_accessor :access_token, :agree_to_code_of_ethics

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Set requirement for signup
  validates :agree_to_tos, :acceptance => true, :on => :create
  validates_presence_of :name

  def notify_creator_of_appraisal_update( appraisal )
    UserMailer.notify_creator_of_appraisal_update( appraisal ).deliver
  end

  def self.notify_appraisers_of_new_appraisal( appraisal )
    appraisers = User.where(:role => "appraiser")
    appraisers.each do |appraiser|
      UserMailer.notify_appraiser_of_new_appraisal( appraiser ,
        appraisal ).deliver
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
        user = User.new(:email => data["email"],
                        :password => Devise.friendly_token[0, 20]
        )
        user.role = "user"
      end
    end
  puts "DATA:::::::"
  p data
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
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.roles
    %w[admin user appraiser]
  end

  def admin?
    self.role == "admin"
  end

  def confirmed
    self.status == EAUserStatusConfirmed
  end

  def crop_avatar
    avatar.recreate_versions! if crop_avatar_x.present?
  end
end