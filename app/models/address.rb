class Address < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :address2, :city, :country, :fax, :phone1, :phone2, :phone3, :state, :zip
end
