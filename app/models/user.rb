class User < ActiveRecord::Base
  has_one  :appraiser_access_token
  has_many :skills
  has_many :appraisals
  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy
  has_many :payments
  has_many :tags
  serialize :appraiser_info, AppraiserInfo

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :skills

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :skills_attributes,
    :photos_attributes, :notify_by_sms, :notify_by_email, :next_notification_interval_in_minutes,
    :payment_method, :uspap, :name, :agree_to_tos, :role, :appraiser_info, :access_token

  # Used for appraiser signup
  attr_accessor :access_token

  # Set requirement for signup
  validates :agree_to_tos, :acceptance => true, :on => :create
  validates_presence_of :name

  def consume_appraiser_access_token(appraiser_access_token)
    self.appraiser_access_token = appraiser_access_token
    appraiser_access_token.used_at = Time.now
    appraiser_access_token.save
    self.role = "appraiser" if self.role.nil?
    self.name = appraiser_access_token.name
    self.save
  end

  def invite_appraiser_by_email(appraiser_access_token)
    message = UserMailer.invite_appraiser(appraiser_access_token)
    message.deliver
    appraiser_access_token
  end

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

  def self.roles
    %w[admin user appraiser]
  end

  def admin?
    self.role == "admin"
  end
end