class CreateCompensations < ActiveRecord::Migration
  def change
    create_table :compensations do |t|
      t.float :amount
      t.integer :appraisal_plan
      t.integer :min_range
      t.integer :max_range

      t.timestamps
    end
  end
end
