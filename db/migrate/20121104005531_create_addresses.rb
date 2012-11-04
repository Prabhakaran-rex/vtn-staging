class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :fax
      t.references :user

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
