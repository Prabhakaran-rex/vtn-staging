class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :address2, :city, :country, :fax, :phone1, :phone2, :phone3, :state, :zip

  validates_presence_of :address, :city, :country, :phone1, :state, :zip, :unless => :address_optional

  private
  def address_optional
  	self.user.is_customer?
  end
end
