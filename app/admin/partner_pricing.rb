ActiveAdmin.register PartnerPricing do
  menu :label => "Partners Pricing"
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index :title => 'Partners Pricing' do
    column :id
    column :short_restricted
    column :full_restricted
    column :full_use
    column :short_restricted_xw
    column :full_restricted_xw
    column :full_use_xw
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :user_id, label: "Customer Name", as: :select, collection: User.where(is_partner: true)
    end
    

    f.inputs "Processing the orders through XW" do

      f.input :short_restricted_xw, label: "Short Restricted Use Price"
      f.input :full_restricted_xw, label: "Full Restricted Use Price"
      f.input :full_use_xw, label: "Full Summary Use Appraisal"
      # f.input :is_partner, :label => "Create Vendor key", :wrapper_html => {:class => "partner_checkbox"}
    end

    f.inputs "Order Processing Outside of Xactware" do
      f.input :short_restricted, label: "Short Restricted Use Price"
      f.input :full_restricted, label: "Full Restricted Use Price"
      f.input :full_use, label: "Full Summary Use Appraisal"
      # f.input :is_partner, :label => "Create Vendor key", :wrapper_html => {:class => "partner_checkbox"}
    end



    f.actions
  end


  controller do
    def new
      @partner_pricing = PartnerPricing.new
    end
  end
  
end
