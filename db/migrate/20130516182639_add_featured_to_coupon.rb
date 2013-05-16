class AddFeaturedToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :featured, :boolean, default: false
  end
end
