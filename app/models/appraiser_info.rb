class AppraiserInfo

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :address, :address2, :city, :state, :country, :zip, :phone1, :phone2, :phone3, :fax,
	:years_appraising, 
	:affiliated_with, :certifications, :description, :bank_name, :bank_routing_number

	# Public profile fields
	attr_accessor :public_name, :public_address, :public_phone, :public_email


	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end
end

