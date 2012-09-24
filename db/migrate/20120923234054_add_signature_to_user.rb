class AddSignatureToUser < ActiveRecord::Migration
  def change
    add_column :users, :signature_json, :text
  end
end
