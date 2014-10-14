ActiveAdmin.register Customer do
  menu :if => proc{ can?(:manage, Customer) }    
  actions :all, :except => [:new, :destroy]

  PAYMENT_TERMS = {"Net 30" => "Net 30",
                   "Net 60" => "Net 60",
                   "Net 90" => "Net 90"}

  action_item :only => :show do
    link_to "Become", "/switch_user?scope_identifier=user_#{customer.id}"
  end
 
	index do
		column :id
		column :email
		column :name
		column :current_sign_in_at
		column :last_sign_in_at
		column :sign_in_count
		default_actions
	end

  filter :id
  filter :name

	form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :secondary_contact_name
      f.input :secondary_contact_email
      f.input :negotiated_cost
      f.input :payment_term, :as => :select, :collection => PAYMENT_TERMS
      f.input :is_partner, :label => "Create Vendor key", :wrapper_html => {:class => "partner_checkbox"}
    end
    f.actions
  end

  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end


  controller do
  	def scoped_collection
  		end_of_association_chain.accessible_by(current_ability)
  	end
  	rescue_from CanCan::AccessDenied do |exception|
  		redirect_to admin_dashboard_path, :alert => exception.message
  	end

  end

  member_action :regenerate_token, :method => :put do 
    user = User.find(params[:id])
    user.re_generate_token
    redirect_to :action => :show
  end

  show :title => :name do
    attributes_table do
      row("Name") {customer.name}
      row("Email") {customer.email}
      row("Created") {customer.created_at}
      row("Status") {customer.status}
      row("Secondary Contact Name") {customer.secondary_contact_name}
      row("Secondary Contact Email") {customer.secondary_contact_email}
      row("Vendor Token") {customer.vendor_token}
      if customer.is_partner
        row "Generate Token" do
          button_to("Regenerate Token", regenerate_token_admin_customer_path(id: customer), method: :put, class: "btn")
        end
      end
      
    end

    panel "Address" do
      render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => customer.address}
    end

    panel "Additional Information" do
      render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => customer.customer_extra}
    end

  end

end
