class PartnerPricing < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :user_id, :xw_flag, :short_restricted, :full_restricted, :full_use, :short_restricted_xw, :full_restricted_xw, :full_use_xw

  validates :short_restricted_xw , numericality: { greater_than_or_equal_to: 0}
  validates :full_restricted_xw , numericality: { greater_than_or_equal_to: 0}
  validates :full_use_xw , numericality: { greater_than_or_equal_to: 0}
  validates :short_restricted , numericality: { greater_than_or_equal_to: 0}
  validates :full_restricted , numericality: { greater_than_or_equal_to: 0}
  validates :full_use , numericality: { greater_than_or_equal_to: 0}
  validates_presence_of :user_id
end
