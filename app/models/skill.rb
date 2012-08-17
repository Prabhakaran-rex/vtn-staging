class Skill < ActiveRecord::Base
  belongs_to :user
  attr_accessible :discipline, :since
  validate :check_for_duplicate

  def check_for_duplicate
    unless self == self.user.skills.find_by_discipline(self.discipline)
      self.errors.add( :base, "Already have that discipline") if self.user.skills.find_by_discipline(self.discipline)
    end
  end

end
