class MoveTradeReferencesToAppraiser < ActiveRecord::Migration
  def up
  	add_column :trade_references, :appraiser_id, :integer
  	remove_column :trade_references, :user_id
  	add_index :trade_references, :appraiser_id
  end

  def down
  	remove_column :trade_references, :appraiser_id
  	add_column :trade_references, :user_id, :integer
  end
end
