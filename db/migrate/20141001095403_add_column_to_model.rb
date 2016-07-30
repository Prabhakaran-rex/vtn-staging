class AddColumnToModel < ActiveRecord::Migration
  def change
    add_column :users, :secondary_contact_name, :string
    add_column :users, :secondary_contact_email, :string

    add_column :users, :negotiated_cost, :decimal, precision: 10, scale: 2, default: 0
    add_column :users, :payment_term, :string

    add_column :appraisals, :is_downloaded, :boolean, :default => false
  end
end
