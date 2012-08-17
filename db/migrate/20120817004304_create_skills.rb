class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :discipline
      t.integer :since
      t.references :user

      t.timestamps
    end
    add_index :skills, :user_id
  end
end
