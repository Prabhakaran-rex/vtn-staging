class MoveSkillsToAppraiser < ActiveRecord::Migration
  def up
  	add_column :skills, :appraiser_id, :integer
  	remove_column :skills, :user_id
  	add_index :skills, :appraiser_id
  end

  def down
  	remove_column :skills, :appraiser_id
  	add_column :skills, :user_id, :integer
  end
end
