class AppraiserAccessToken < ActiveRecord::Base
  belongs_to :user

  attr_accessible :email, :name, :user_id

  before_create :set_random_token
  after_create :notify_invited_appraiser

  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :token, :case_sensitive => true

  def set_random_token
    self.token = CGI::escape(SecureRandom.hex(19)) unless self.token
  end

  def to_param
    self.token
  end

  def notify_invited_appraiser
    message = UserMailer.invite_appraiser(self)
    message.deliver
  end
end
