class AddAppraiserReferralToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referral_id, :string
  end
end
