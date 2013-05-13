class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :discount
      t.string :discount_type
      t.boolean :active, default: true
      t.datetime :expiration_date
      t.datetime :used_on

      t.timestamps
    end
  end
end
