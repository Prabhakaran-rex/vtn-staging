class UserPlugin < Refinery::Core::BaseModel
  belongs_to :user
  attr_accessible :name, :position, :user_id
end
