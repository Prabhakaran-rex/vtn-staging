class AddLastStepToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_step, :string
  end
end
