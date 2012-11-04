class TradeReference < ActiveRecord::Base
  belongs_to :appraiser
  attr_accessible :company, :contact, :phone, :appraiser_id

  validates_presence_of :company, :contact, :phone 
end
