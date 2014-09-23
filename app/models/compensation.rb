class Compensation < ActiveRecord::Base
  has_paper_trail
  attr_accessible :amount, :appraisal_plan, :max_range, :min_range, :is_over
  validates_presence_of :appraisal_plan
  validates_numericality_of :max_range, :min_range, :amount, unless: :check_is_over?
  validates_numericality_of :min_range, :amount, if: :check_is_over?

  def self.get_paid_amount(appraisal_plan, duration)
    if duration.to_i <= Compensation.where("appraisal_plan =?", appraisal_plan).maximum("max_range").to_i
  	  compensation = Compensation.where("appraisal_plan =? and min_range <= ? and ? < max_range ", appraisal_plan, duration,duration)
    else
      compensation = Compensation.where("appraisal_plan =? and min_range < ? and is_over=true", appraisal_plan, duration)
    end
    
    unless compensation.nil? || compensation.empty?
  		compensation.first.amount
  	end
  end

  def check_is_over?
    is_over == true
  end
end
