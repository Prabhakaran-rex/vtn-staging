class AddIsPaidToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :is_paid_by_partner, :boolean, default: false
  end
end
