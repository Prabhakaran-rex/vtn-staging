class AddAllowedProductsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :allowed_products, :text
  end
end
