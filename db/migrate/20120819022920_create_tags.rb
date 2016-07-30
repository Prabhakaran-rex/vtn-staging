class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :photo
      t.string :label
      t.integer :width
      t.integer :height
      t.integer :top
      t.integer :left

      t.timestamps
    end
    add_index :tags, :photo_id
  end
end
