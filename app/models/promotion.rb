class Promotion < ActiveRecord::Base
  attr_accessible :active, :description, :name
  has_many :coupons, dependent: :nullify
  validates_presence_of :name, :description
  validates_uniqueness_of :name
end
