class AddAppraiserReferralToAppraisal < ActiveRecord::Migration
  def change
    add_column :appraisals, :appraiser_referral, :string
  end
end
