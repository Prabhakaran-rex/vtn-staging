ActiveAdmin.register Customer do
  menu :if => proc{ can?(:manage, Customer) }    
  actions :all, :except => [:new, :destroy] 
 
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
    end
    f.buttons
  end

  after_create { |admin| admin.send_reset_password_instructions }
  def password_required?
    new_record? ? false : super
  end


  controller do
  	load_and_authorize_resource :except => :index
  	def scoped_collection
  		end_of_association_chain.accessible_by(current_ability)
  	end
  	rescue_from CanCan::AccessDenied do |exception|
  		redirect_to admin_dashboard_path, :alert => exception.message
  	end
  end

  show :title => :name do
    attributes_table do
      row("Name") {customer.name}
      row("Email") {customer.email}
      row("Created") {customer.created_at}
      row("Status") {customer.status}
    end

    panel "Additional Information" do
      render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => customer.customer_extra}
    end
  end

  sidebar :change_user do
    raw "#{switch_user_select}"
  end
end
