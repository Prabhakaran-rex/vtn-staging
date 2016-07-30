class AddColumnToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :sent_24h, :boolean, default: false
    add_column :appraisals, :sent_48h, :boolean, default: false
    add_column :appraisals, :sent_72h, :boolean, default: false
    add_column :appraisals, :sent_1w, :boolean, default: false
    add_column :appraisals, :sent_2w, :boolean, default: false
    add_column :appraisals, :sent_30d, :boolean, default: false
  end
end
