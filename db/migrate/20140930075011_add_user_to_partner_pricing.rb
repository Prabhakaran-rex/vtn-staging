class AddUserToPartnerPricing < ActiveRecord::Migration
  def change
    add_reference :partner_pricings, :user, index: true
  end
end
