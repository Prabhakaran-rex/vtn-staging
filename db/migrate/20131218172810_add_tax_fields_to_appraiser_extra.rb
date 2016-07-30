class AddTaxFieldsToAppraiserExtra < ActiveRecord::Migration
  def change
    add_column :appraiser_extras, :tax_name, :string
    add_column :appraiser_extras, :tax_address, :string
    add_column :appraiser_extras, :tax_id, :string
    add_column :appraiser_extras, :tax_ein, :string
    add_column :appraiser_extras, :tax_wages, :float
  end
end
