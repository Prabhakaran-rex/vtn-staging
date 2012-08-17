class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :discipline, :since
end
