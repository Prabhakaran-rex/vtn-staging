class CreateAppraisalActivities < ActiveRecord::Migration
  def change
    create_table :appraisal_activities do |t|
      t.references :appraisal
      t.references :user
      t.integer :activity_type
      t.integer :activity_value
      t.datetime :activity_datetime

      t.timestamps
    end
    add_index :appraisal_activities, :user_id
  end
end
