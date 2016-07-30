class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :appraisal
  attr_accessible :task_mapper_id, :task_mapper_provider, :user_id, :appraisal_id
  attr_accessor :title, :description

  validates_presence_of :user_id, :appraisal_id, :task_mapper_id, :task_mapper_provider
end
