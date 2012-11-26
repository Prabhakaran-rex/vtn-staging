class Payout < ActiveRecord::Base
  belongs_to :appraisal
  belongs_to :appraiser
  attr_accessible :amount, :status, :appraiser_id, :appraisal_id
  validates_presence_of :amount, :status
end
