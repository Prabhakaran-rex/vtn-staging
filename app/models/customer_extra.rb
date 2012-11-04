class CustomerExtra < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :placeholder
end
