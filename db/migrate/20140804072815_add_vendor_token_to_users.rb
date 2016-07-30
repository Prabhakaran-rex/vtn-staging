class AddVendorTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vendor_token, :string
  end
end
