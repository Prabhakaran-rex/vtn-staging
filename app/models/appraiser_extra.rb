class AppraiserExtra < ActiveRecord::Base
  belongs_to :appraiser
  attr_accessible :affiliated_with, :bank_name, :bank_name_plain, :bank_routing_number, :bank_routing_number_plain, :certifications, :description, :signature_json, :uspap, :years_appraising
  attr_accessible :tax_ein, :tax_wages, :tax_id, :tax_name, :tax_address, :tax_address_2

  attr_encrypted :bank_name_plain, :key => ENCRYPTION_KEY, :charset => :default, :attribute => 'bank_name'
  attr_encrypted :bank_routing_number_plain, :key => ENCRYPTION_KEY, :charset => :default, :attribute => 'bank_routing_number'

  validates_presence_of :affiliated_with, :certifications, :description, :years_appraising, :uspap

  def tax_info_complete?
    !(tax_wages.blank? || tax_name.blank? || tax_address.blank? || tax_address_2.blank?) && (!tax_ein.blank? || !tax_wages.blank?)
  end
end
