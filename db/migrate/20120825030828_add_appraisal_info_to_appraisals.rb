class AddAppraisalInfoToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :appraisal_info, :text
  end
end
