class Classification < ActiveRecord::Base
  belongs_to :appraisal
  belongs_to :category
  attr_accessible :appraisal_id, :category_id

  validates_presence_of :appraisal_id, :category_id
end
