class AddUsersToAppraisals < ActiveRecord::Migration
  def change
	add_column :appraisals,	:created_by,	:integer
	add_column :appraisals,	:assigned_to,	:integer
	add_column :appraisals, :assigned_on,	:integer
	
	add_index  :appraisals, :created_by
	add_index  :appraisals, :assigned_to
  end
end
