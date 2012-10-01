class TradeReference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :company, :contact, :phone, :user_id

  validates_presence_of :company, :contact, :phone 
end
