class User < ActiveRecord::Base
  rolify
  # has_many :skills
  has_many :appraisals
  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy
  has_many :payments
  has_many :tags
  has_many :tickets
  # has_many :trade_references, :dependent => :destroy
  serialize :appraiser_info, AppraiserInfo

# STI Migration
  attr_accessible :type
  has_one :address
  accepts_nested_attributes_for :address
  after_create :create_address
# END STI Migration

  # The following is used for cropping & storing the signature image
  validates_attachment_size :signature, :less_than => 8.megabytes
  validates_attachment_content_type :signature, :content_type => /image/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_signature, :if => :cropping?

  has_attached_file :signature, :styles => {:standard => "550x550>", :small => { :processors => [:cropper], :geometry => '250x100!' }},
                    :convert_options => {
                      :all => '-auto-orient'
                    },
                    :storage => FILE_STORAGE[Rails.env]['storage'],
                    :path => FILE_STORAGE[Rails.env]['path'],
                    :url => FILE_STORAGE[Rails.env]['url'],
                    :s3_credentials => "#{Rails.root.to_s}/config/s3.yml",
                    :default_url => '/images/interface/missing.png'

  mount_uploader :avatar, AvatarUploader
  attr_accessor :crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h
  after_update :crop_avatar

  accepts_nested_attributes_for :photos, :allow_destroy => true
  # accepts_nested_attributes_for :skills
  # accepts_nested_attributes_for :trade_references, :allow_destroy => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me,
    :photos_attributes, :notify_by_sms, :notify_by_email, :next_notification_interval_in_minutes,
    :payment_method, :uspap, :name, :agree_to_tos, :role, :appraiser_info, :access_token, :login, :signature_json, :signature, :status, :agree_to_code_of_ethics, :avatar, :avatar_cache, :remove_avatar

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

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def signature_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(signature.path(style))
  end

  def is_appraiser_application_complete
    begin
      !self.name.empty? && !self.appraiser_info.address.empty? && !self.appraiser_info.city.empty? &&
      !self.appraiser_info.state.empty? && !self.appraiser_info.country.empty? && !self.appraiser_info.zip.empty? &&
      !self.appraiser_info.phone1.empty? && !self.appraiser_info.years_appraising.empty? && !self.appraiser_info.affiliated_with.empty? &&
      !self.appraiser_info.certifications.empty? && !self.appraiser_info.description.empty? && !self.appraiser_info.uspap.empty? &&
      self.skills.count > 0 && self.trade_references.count >= 3
    rescue Exception => e
      return false
    end
    
  end

  def submit_application
    self.status = EAUserStatusReview
    self.save
    notify_admin_of_new_application
  end

  def crop_avatar
    avatar.recreate_versions! if crop_avatar_x.present?
  end

  private
  def reprocess_signature
    signature.reprocess!
  end

  def notify_admin_of_new_application
    message = Message.new(:name => self.name, :email => self.email )
    UserMailer.notify_admin_of_new_application(message).deliver
  end


end