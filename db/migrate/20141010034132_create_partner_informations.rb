class CreatePartnerInformations < ActiveRecord::Migration
  def change
    create_table :partner_informations do |t|
      t.string :company_name
      t.string :client_name
      t.string :address
      t.string :city_state_potal
      t.string :claim_number
      t.string :token
      t.references :appraisal, index: true

      t.timestamps
    end
  end
end
