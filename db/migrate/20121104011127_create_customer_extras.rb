class CreateCustomerExtras < ActiveRecord::Migration
  def change
    create_table :customer_extras do |t|
      t.string :placeholder
      t.references :customer

      t.timestamps
    end
    add_index :customer_extras, :customer_id
  end
end
