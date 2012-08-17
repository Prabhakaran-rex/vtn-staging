class CreateAppraiserAccessTokens < ActiveRecord::Migration
  def change
    create_table :appraiser_access_tokens do |t|
      t.references :user
      t.string :token
      t.string :email
      t.string :name
      t.timestamp :used_at

      t.timestamps
    end
    add_index :appraiser_access_tokens, :user_id
  end
end
