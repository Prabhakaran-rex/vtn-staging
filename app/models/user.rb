class User < ActiveRecord::Base
  has_one  :appraiser_access_token
  has_many :skills
  has_many :appraisals
  has_many :appraisal_activities
  has_many :photos, :dependent => :destroy
  has_many :payments

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :skills

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :skills_attributes,
    :photos_attributes, :notify_by_sms, :notify_by_email, :next_notification_interval_in_minutes,
    :payment_method, :uspap, :name, :agree_to_tos

  # Set requirement for signup
  validates :agree_to_tos, :acceptance => true, :on => :create

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

  def self.roles
    %w[admin user appraiser]
  end
end