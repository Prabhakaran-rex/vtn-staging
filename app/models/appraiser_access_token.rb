class AppraiserAccessToken < ActiveRecord::Base
  belongs_to :user

  attr_accessible :email, :name

  before_create :set_random_token

  validates_uniqueness_of :email, :case_sensitive => false
  validates_uniqueness_of :token, :case_sensitive => true

  def set_random_token
    self.token = CGI::escape(ActiveSupport::SecureRandom.hex(19)) unless self.token
  end

  def to_param
    self.token
  end
end
