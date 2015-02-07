class AddIsDenyEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_deny_email, :boolean, default: false
  end
end
