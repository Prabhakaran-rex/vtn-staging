class Skill < ActiveRecord::Base
  belongs_to :appraiser
  belongs_to :category
  attr_accessible :discipline, :since, :user_id, :category_id, :appraiser_id
  # validate :check_for_duplicate

	# For backward compatibility
	def user_id
	  self[:appraiser_id]
	end

	def user_id=(val)
	  self[:appraiser_id] = val
	end

  def check_for_duplicate
    unless self == self.appraiser.skills.find_by_discipline(self.discipline)
      self.errors.add( :base, "Already have that discipline") if self.appraiser.skills.find_by_discipline(self.discipline)
    end
  end

end
