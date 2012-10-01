class CreateTradeReferences < ActiveRecord::Migration
  def change
    create_table :trade_references do |t|
      t.string :company
      t.string :contact
      t.string :phone
      t.references :user

      t.timestamps
    end
    add_index :trade_references, :user_id
  end
end
