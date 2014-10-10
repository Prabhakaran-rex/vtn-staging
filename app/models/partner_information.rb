class PartnerInformation < ActiveRecord::Base
  belongs_to :appraisal
  attr_accessible :company_name, :client_name, :address, :city_state_potal, :claim_number, :token, :appraisal_id
end
