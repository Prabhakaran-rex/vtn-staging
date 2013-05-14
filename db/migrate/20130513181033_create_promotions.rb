class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_column :coupons, :promotion_id, :integer
  end
end
