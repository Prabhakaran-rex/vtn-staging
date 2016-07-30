class AddTitleToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :title, :string
  end
end
