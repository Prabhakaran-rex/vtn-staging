ActiveAdmin.register Coupon do
	actions :all, :except => [:destroy]

  form do |f|
    f.inputs "Coupon Details" do
      f.input :promotion
      f.input :code, hint: "Leave blank if you want the system to generate the code automatically"
      f.input :discount, hint: "For percentage discounts (20%) enter '20'; for fixed discounts enter the amount in dollars"
      f.input :discount_type, :as => :select, :collection => ["fixed", "percentage"]
      f.input :expiration_date
    end
  end
end
