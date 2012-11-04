class AppraiserExtra < ActiveRecord::Base
  belongs_to :appraiser
  attr_accessible :affiliated_with, :bank_name, :bank_routing_number, :certifications, :description, :signature_json, :uspap, :years_appraising
end
