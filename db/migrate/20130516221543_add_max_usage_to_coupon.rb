class AddMaxUsageToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :max_usage, :integer, default: 1
    add_column :coupons, :usage_count, :integer, default: 0
    add_column :coupons, :start_date, :datetime, default: Time.now
    add_column :coupons, :description, :string
  end
end
