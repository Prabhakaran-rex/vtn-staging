class AddIsOverToCompensations < ActiveRecord::Migration
  def change
    add_column :compensations, :is_over, :boolean, :default => false
  end
end
