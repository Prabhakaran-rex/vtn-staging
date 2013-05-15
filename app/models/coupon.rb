class Coupon < ActiveRecord::Base
  belongs_to :promotion
  attr_accessible :code, :discount, :discount_type, :expiration_date, :used_on, :promotion_id, :active
  validates_presence_of :code, :discount, :expiration_date, :promotion_id
  validates :discount, :numericality => { :greater_than_or_equal_to => 0.1 }
  validates :code, :length => { :is => 16 }
  validates :discount_type, :inclusion => { :in => %w(fixed percentage)}
  validate :expiration_date_cannot_be_in_the_past, :percentage_coupon_should_not_be_bigger_than_100, :fixed_coupon_should_not_be_too_large
  validate :used_on_should_be_greater_than_expiration_date
  validates_uniqueness_of :code

  before_validation :generate_unique_code

  def self.is_coupon_valid?(coupon_code)
    coupon = Coupon.find_by_code(coupon_code)
    coupon.nil? ? false : coupon.is_active? && !coupon.is_expired?
  end

  def self.details_for(coupon_code)
    Coupon.find_by_code(coupon_code)
  end

  def is_active?
    self.active
  end

  def is_used?
    !self.used_on.nil?
  end

  def deactivate!
    change_active_status(false)
  end

  def activate!
    change_active_status(true)
  end

  def apply!
    if is_active? && !is_expired? && !is_used?
      update_attributes(used_on: Time.now)
    end
  end

  def is_expired?
    expiration_date < Date.today
  end

  def calculate_discount(amount)
    if discount_type == "fixed"
      return amount - discount
    elsif discount_type == "percentage"
      return amount * (1- discount/100)
    end
    amount
  end

  private
  def change_active_status(status)
    self.active = status
    self.save
  end

  def expiration_date_cannot_be_in_the_past
    if expiration_date.blank? or is_expired? or expiration_date.nil?
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def percentage_coupon_should_not_be_bigger_than_100
    if discount_type == "percentage" and discount > 100
      errors.add(:discount, "can't be bigger than 100 for percentage coupons")
    end
  end

  def fixed_coupon_should_not_be_too_large
    if discount_type == "fixed" and discount.to_f > PAYMENT_PLAN.sort.last
      errors.add(:discount, "can't be bigger than the most expensive appraisal")
    end
  end

  def used_on_should_be_greater_than_expiration_date
    if !used_on.nil? and used_on > expiration_date
      errors.add(:used_on, "coupon has expired")
    end
  end

  def generate_unique_code
    if code.blank? or code.nil?
      self.code = code_generator
    end
  end

  def code_generator
    return SecureRandom.hex(10)[0...16].upcase
  end
end