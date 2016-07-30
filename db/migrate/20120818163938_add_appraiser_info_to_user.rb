class AddAppraiserInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :appraiser_info, :text
  end
end
