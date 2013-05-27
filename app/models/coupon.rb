class Coupon < ActiveRecord::Base
  belongs_to :promotion
  attr_accessible :allowed_products, :code, :description, :discount, :discount_type, :expiration_date, :featured, :used_on, :promotion_id, :active, :start_date, :max_discount, :max_usage
  validates_presence_of :code, :discount, :expiration_date, :max_usage, :promotion_id, :start_date
  validates :discount, :numericality => { :greater_than_or_equal_to => 0.1 }
  validates :code, :length => { :is => 16 }
  validates :discount_type, :inclusion => { :in => %w(fixed percentage)}
  validate :expiration_date_cannot_be_in_the_past_or_before_start_date, :percentage_coupon_should_not_be_bigger_than_100, :fixed_coupon_should_not_be_too_large
  validate :only_existing_products_can_be_allowed
  validate :should_have_description_if_featured
  validate :used_on_should_be_greater_than_expiration_date
  validates_uniqueness_of :code
  validates_uniqueness_of :featured, :if => :featured
  serialize :allowed_products, Array
  before_validation :sanitize_allowed_products_list
  has_many :coupon_usages

  before_validation :generate_unique_code

  def self.is_coupon_valid?(coupon_code)
    coupon = Coupon.find_by_code(coupon_code)
    coupon.nil? ? false : coupon.is_active? && !coupon.is_expired? && coupon.start_date <= Time.now && coupon.expiration_date > Time.now
  end

  def self.details_for(coupon_code)
    Coupon.find_by_code(coupon_code)
  end

  def self.get_featured
    coupon = Coupon.find_by_featured(true)
    if !coupon.nil? && coupon.is_active? && !coupon.is_expired? && coupon.start_date <= Time.now
      return coupon
    end
    nil
  end

  def valid_for_appraisal?(appraisal_type)
    self.allowed_products.to_a.empty? || self.allowed_products.to_a.include?(appraisal_type)
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

  def apply!(appraisal)
    if is_active? && !is_expired? && (usage_count < max_usage) && valid_for_appraisal?(appraisal.selected_plan)
      increment_usage_count(appraisal)
      result =update_attributes(used_on: Time.now)
    end
    result ||= false
  end

  def is_expired?
    expiration_date < Date.today
  end

  def calculate_discounted_amount(amount)
    if discount_type == "fixed"
      discounted_amount = amount - discount
    elsif discount_type == "percentage"
      discounted_amount = amount * (1- discount/100)
    end
    if max_discount
      discounted_amount = (amount - max_discount) if amount > max_discount
    end
    return discounted_amount
  end

  def gross_profit
    gross_amount = 0
    self.coupon_usages.each do |usage|
      appraisal = usage.appraisal
      if appraisal.status == EActivityValueFinalized
        gross_amount += appraisal.payment.amount - appraisal.payout.amount
      end
    end
    gross_amount
  end

  private
  def increment_usage_count(appraisal)
    self.usage_count += 1 if CouponUsage.create({coupon_id: self.id, appraisal_id: appraisal.id})
    self.save
  end

  def change_active_status(status)
    self.active = status
    self.save
  end

  def expiration_date_cannot_be_in_the_past_or_before_start_date
    if expiration_date.blank? or is_expired? or expiration_date.nil?
      errors.add(:expiration_date, "can't be in the past")
    elsif expiration_date_before_start_date?
      errors.add(:expiration_date, "can't be before start date")
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

  def expiration_date_before_start_date?
    start_date.nil? || start_date > expiration_date
  end

  def should_have_description_if_featured
    if self.featured && description.blank?
      errors.add(:description, "is required if the coupon is marked as featured")
    end
  end

  def only_existing_products_can_be_allowed
    if !(self.allowed_products.to_a - APPRAISAL_PLANS).empty?
      errors.add(:allowed_products, "not an existing product")
    end
  end

  def sanitize_allowed_products_list
    self.allowed_products = self.allowed_products.to_a.map {|x| x.to_i} - [0]
  end
end
