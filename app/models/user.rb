class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_one  :appraiser_access_token
  has_many :appraisals
  has_many :photos, :dependent => :destroy
  has_many :skills

  accepts_nested_attributes_for :photos, :allow_destroy => true

  
  # attr_accessible :title, :body
end