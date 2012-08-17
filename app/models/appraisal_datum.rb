class AppraisalDatum < ActiveRecord::Base
  belongs_to :appraisal
  attr_accessible :datatype, :value
end
