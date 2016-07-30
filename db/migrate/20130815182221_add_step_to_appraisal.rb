class AddStepToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :step, :string
  end
end
