class CouponUsage < ActiveRecord::Base
  belongs_to :coupon
  belongs_to :appraisal
  attr_accessible :coupon_id, :appraisal_id
end
