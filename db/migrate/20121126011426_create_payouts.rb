class CreatePayouts < ActiveRecord::Migration
  def change
    create_table :payouts do |t|
      t.references :appraisal, :null => false
      t.references :appraiser, :null => false
      t.float :amount, :null => false
      t.integer :status, :null => false, :default => 0

      t.timestamps
    end
    add_index :payouts, :appraisal_id
    add_index :payouts, :appraiser_id
  end
end
