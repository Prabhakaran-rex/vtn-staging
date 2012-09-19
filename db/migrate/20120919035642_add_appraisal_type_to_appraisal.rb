class AddAppraisalTypeToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :appraisal_type, :integer
  end
end
