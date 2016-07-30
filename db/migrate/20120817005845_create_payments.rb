class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user
      t.references :appraisal
      t.boolean :is_charged
      t.string :auth_code
      t.string :ccnum
      t.float :amount
      t.boolean :is_refund

      t.timestamps
    end
    add_index :payments, :user_id
    add_index :payments, :appraisal_id
  end
end
