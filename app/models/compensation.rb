class Compensation < ActiveRecord::Base
  has_paper_trail
  attr_accessible :amount, :appraisal_plan, :max_range, :min_range
  validates_presence_of :appraisal_plan
  validates_numericality_of :max_range, :min_range, :amount

  def self.get_paid_amount(appraisal_plan, duration)
  	compensation = Compensation.where("appraisal_plan =? and min_range < ? and ? < max_range ", appraisal_plan, duration,duration)
  	unless compensation.nil? || compensation.empty?
  		compensation.first.amount
  	end
  end
end
