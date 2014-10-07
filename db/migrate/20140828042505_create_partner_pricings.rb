class CreatePartnerPricings < ActiveRecord::Migration
  def change
    create_table :partner_pricings do |t|
      t.boolean :xw_flag
      t.decimal :short_restricted, precision: 10, scale: 2, default: 0
      t.decimal :full_restricted, precision: 10, scale: 2, default: 0
      t.decimal :full_use, precision: 10, scale: 2, default: 0
      t.decimal :short_restricted_xw, precision: 10, scale: 2, default: 0
      t.decimal :full_restricted_xw, precision: 10, scale: 2, default: 0
      t.decimal :full_use_xw, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
