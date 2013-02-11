class AddAllowShareToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :allow_share, :boolean, :default => true
  end
end
