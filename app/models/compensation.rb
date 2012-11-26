class Compensation < ActiveRecord::Base
  attr_accessible :amount, :appraisal_plan, :max_range, :min_range
  validates_presence_of :appraisal_plan
  validates_numericality_of :max_range, :min_range, :amount
end
