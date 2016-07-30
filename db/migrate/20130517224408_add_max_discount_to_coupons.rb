class AddMaxDiscountToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :max_discount, :float
  end
end
