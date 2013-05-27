class CreateCouponUsages < ActiveRecord::Migration
  def change
    create_table :coupon_usages do |t|
      t.references :coupon
      t.references :appraisal

      t.timestamps
    end
    add_index :coupon_usages, :coupon_id
    add_index :coupon_usages, :appraisal_id
  end
end
