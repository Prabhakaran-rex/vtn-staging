class ChangeAppraisalNameToText < ActiveRecord::Migration
  def up
  	change_column :appraisals, :name, :text
  end

  def down
  	change_column :appraisals, :name, :string
  end
end
