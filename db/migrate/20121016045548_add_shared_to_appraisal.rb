class AddSharedToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :shared, :boolean, :default => false
  end
end
