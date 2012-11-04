class CreateAppraiserExtras < ActiveRecord::Migration
  def change
    create_table :appraiser_extras do |t|
      t.string :years_appraising
      t.string :affiliated_with
      t.string :certifications
      t.string :description
      t.string :bank_name
      t.string :bank_routing_number
      t.integer :uspap
      t.text :signature_json
      t.references :appraiser

      t.timestamps
    end
    add_index :appraiser_extras, :appraiser_id
  end
end
