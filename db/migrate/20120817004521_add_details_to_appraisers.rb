class AddDetailsToAppraisers < ActiveRecord::Migration
  def change
    add_column :users, :notify_by_sms, :boolean , :default => false
	add_column :users, :notify_by_email, :boolean, :default => true
	add_column :users, :next_notification_interval_in_minutes, :integer, :default => 60
    add_column :users, :next_notification_due_at, :datetime  , :default => Time.now
    add_column :users, :payment_method , :string  , :default => "cheque"
    add_column :users, :uspap , :boolean , :default => false
  end
end
