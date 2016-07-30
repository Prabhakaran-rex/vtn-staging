class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :appraisal
      t.references :user

      t.timestamps
    end
    add_index :photos, :appraisal_id
    add_index :photos, :user_id
  end
end
