class Appraiser < User

  alias_attribute :user_id, :id

  has_one :appraiser_extra
  accepts_nested_attributes_for :appraiser_extra
  after_create :create_appraiser_extra

  has_many :trade_references, :dependent => :destroy
  accepts_nested_attributes_for :trade_references, :allow_destroy => true
  attr_accessible :trade_references_attributes

  has_many :skills, :dependent => :destroy
  accepts_nested_attributes_for :skills, :allow_destroy => true
  attr_accessible :skills_attributes
end