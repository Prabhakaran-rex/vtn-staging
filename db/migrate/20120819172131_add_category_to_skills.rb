class AddCategoryToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :category_id, :integer
    add_index :skills, :category_id
  end
end
