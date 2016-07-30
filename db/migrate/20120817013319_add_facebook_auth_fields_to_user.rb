class AddFacebookAuthFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :facebook_token , :string
    add_column :users, :facebook_location , :string
    add_column :users, :facebook_location_id , :string
    add_column :users, :facebook_gender , :string
    add_column :users, :facebook_verified , :string
    add_column :users, :facebook_updated , :string
    add_column :users, :facebook_locale , :string
    add_column :users, :facebook_id , :string

    add_index :users , :facebook_id
  end
end
