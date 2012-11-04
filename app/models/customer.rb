class Customer < User
  has_one :customer_extra
  accepts_nested_attributes_for :customer_extra
  after_create :create_customer_extra
end