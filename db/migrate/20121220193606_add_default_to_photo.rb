class AddDefaultToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :default, :boolean, :default => false
  end
end
