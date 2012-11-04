class AppraiserExtra < ActiveRecord::Base
  belongs_to :appraiser
  attr_accessible :affiliated_with, :bank_name, :bank_name_plain, :bank_routing_number, :bank_routing_number_plain, :certifications, :description, :signature_json, :uspap, :years_appraising

  attr_encrypted :bank_name_plain, :key => ENCRYPTION_KEY, :charset => :default, :attribute => 'bank_name'
  attr_encrypted :bank_routing_number_plain, :key => ENCRYPTION_KEY, :charset => :default, :attribute => 'bank_routing_number'
end
