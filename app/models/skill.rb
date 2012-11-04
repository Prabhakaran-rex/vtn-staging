class Skill < ActiveRecord::Base
  belongs_to :appraiser
  belongs_to :category
  attr_accessible :discipline, :since, :appraiser_id, :category_id
  # validate :check_for_duplicate

  def check_for_duplicate
    unless self == self.appraiser.skills.find_by_discipline(self.discipline)
      self.errors.add( :base, "Already have that discipline") if self.appraiser.skills.find_by_discipline(self.discipline)
    end
  end

end
