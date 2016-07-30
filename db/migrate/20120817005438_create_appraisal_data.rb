class CreateAppraisalData < ActiveRecord::Migration
  def change
    create_table :appraisal_data do |t|
      t.references :appraisal
      t.integer :datatype
      t.string :value

      t.timestamps
    end
    add_index :appraisal_data, :appraisal_id
  end
end
