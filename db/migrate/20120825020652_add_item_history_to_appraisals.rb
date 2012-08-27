class AddItemHistoryToAppraisals < ActiveRecord::Migration
  def change
    add_column :appraisals, :item_history, :text
  end
end
