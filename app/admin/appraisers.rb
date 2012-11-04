ActiveAdmin.register Appraiser do
menu :if => proc{ can?(:manage, Appraiser) }     

  action_item :only => :show do
    link_to('Approve', update_appraiser_status_path(:user => appraiser, :status => EAUserStatusConfirmed)) if appraiser.role == "appraiser" && appraiser.status == EAUserStatusReview
  end  
  action_item :only => :show do
    link_to('Reject', update_appraiser_status_path(:user => appraiser, :status => EAUserStatusRejected)) if appraiser.role == "appraiser" && appraiser.status == EAUserStatusReview
  end  
 
 
	index do
		column :id
		column :email
		column :name
		column :role
		column :current_sign_in_at
		column :last_sign_in_at
		column :sign_in_count
		default_actions
	end

  filter :id
  filter :name
  filter :role, :as => :select, :collection => User.roles

	form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
      f.input :role, :as => :select, :collection => User.roles
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
      row("Name") {appraiser.name}
      row("Email") {appraiser.email}
      row("Created") {appraiser.created_at}
      row("Role") {appraiser.role}
      row("Status") {appraiser.status}
    end

    # panel "Avatar" do
    #   render "appraiser_avatar", :locals => {:user => user}
    # end

    panel "Additional Information" do
       render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => appraiser.appraiser_extra}
    end

    panel "Trade References" do
      render :partial => "admin/users/trade_references", :locals => {:user => appraiser}      
    end
  end
end
