class Skill < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :discipline, :since, :user_id, :category_id
  # validate :check_for_duplicate

  def check_for_duplicate
    unless self == self.user.skills.find_by_discipline(self.discipline)
      self.errors.add( :base, "Already have that discipline") if self.user.skills.find_by_discipline(self.discipline)
    end
  end

end
