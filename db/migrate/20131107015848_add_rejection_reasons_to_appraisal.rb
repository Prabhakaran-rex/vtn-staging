class AddRejectionReasonsToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :rejection_reason, :text
  end
end
