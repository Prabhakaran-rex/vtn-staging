class TradeReference
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :company, :contact, :phone

	def initialize(attributes = {})
		attributes.each do |name, value|
			send("#{name}=", value)
		end
	end
end
