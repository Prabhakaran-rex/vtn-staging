class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.references :appraisal
      t.references :category

      t.timestamps
    end
    add_index :classifications, :appraisal_id
    add_index :classifications, :category_id
  end
end
