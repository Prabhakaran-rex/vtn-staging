class AddExtraTaxAddressToAppraiserExtra < ActiveRecord::Migration
  def change
    add_column :appraiser_extras, :tax_address_2, :string
  end
end
