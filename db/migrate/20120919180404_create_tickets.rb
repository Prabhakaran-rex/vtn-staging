class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user
      t.references :appraisal
      t.integer :task_mapper_id
      t.string :task_mapper_provider

      t.timestamps
    end
    add_index :tickets, :user_id
    add_index :tickets, :appraisal_id
  end
end
