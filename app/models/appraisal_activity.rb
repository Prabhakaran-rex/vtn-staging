class AppraisalActivity < ActiveRecord::Base
  belongs_to :user
  attr_accessible :activity_datetime, :activity_type, :activity_value, :appraisal
end
