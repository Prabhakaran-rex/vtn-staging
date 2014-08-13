class AddColumnToUserIsPartner < ActiveRecord::Migration
  def change
    add_column :users, :is_partner, :boolean, :default => false
  end
end
