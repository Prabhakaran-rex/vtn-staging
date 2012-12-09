class Customer < User

  alias_attribute :user_id, :id

  has_one :customer_extra
  accepts_nested_attributes_for :customer_extra
  after_create :create_customer_extra
  attr_accessible :customer_extra_attributes
  devise :omniauthable

  private
  def create_customer_extra
    y = CustomerExtra.new(); y.customer_id = self.id;
    y.save(:validate => false)
  end
end