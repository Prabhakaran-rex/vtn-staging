class Customer < User

  alias_attribute :user_id, :id

  has_one :customer_extra
  accepts_nested_attributes_for :customer_extra
  after_create :create_customer_extra
end