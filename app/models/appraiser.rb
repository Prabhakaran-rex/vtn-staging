class Appraiser < User
  has_one :appraiser_extra
  accepts_nested_attributes_for :appraiser_extra
  after_create :create_appraiser_extra
end