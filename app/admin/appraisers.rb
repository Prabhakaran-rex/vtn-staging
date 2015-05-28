ActiveAdmin.register Appraiser do
  menu :if => proc{ can?(:manage, Appraiser) } 

  csv do
    column :id
    column :email
    column :username
    column :address do |t|
      t.address.address
    end
    column :city do |t|
      t.address.city
    end
    column :state do |t|
      t.address.state
    end

    column :country do |t|
      t.address.country
    end

    column :postal_code do |t|
      t.address.zip
    end

    column :phone do |t|
      t.address.phone1
    end

    column :reset_password_sent_at
    column :remember_created_at
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    column :role
    column :notify_by_sms
    column :notify_by_email
    column :next_notification_interval_in_minutes
    column :next_notification_due_at
    column :payment_method
    column :uspap
    column :name
    column :facebook_token
    column :facebook_location
    column :facebook_location_id
    column :facebook_gender
    column :facebook_verified
    column :facebook_updated
    column :facebook_locale
    column :facebook_id
    column :appraiser_info
    column :signature_json
    column :status
    column :confirmation_token
    column :confirmed_at
    column :confirmation_sent_at

    column :avatar
    column :type
    column :website

    column :paypal_email
    column :last_step
    column :signature
    column :referral_id
    column :vendor_token

    column :is_partner
    column :client_id
    column :secondary_contact_name
    column :secondary_contact_email
    column :negotiated_cost
    column :payment_term
    column :is_deny_email
  end

  actions :all, :except => [:new, :destroy]    

  action_item :only => :show do
    link_to('Reapply', update_appraiser_status_path(:user => appraiser, :status => EAUserStatusPending)) if appraiser.is_appraiser? && appraiser.status == EAUserStatusRejected
  end

  action_item :only => :show do
    link_to "Become", "/switch_user?scope_identifier=user_#{appraiser.id}"
  end

  index do
    column :id
    column :email
    column :name
    column :status, :sortable => "users.status" do |appraiser|
      appraiser.status_as_string
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :referral_id
    default_actions
  end

  filter :id
  filter :name
  filter :status, :as => :select, :collection => EAUserStatusHash.map {|k,v| [v,k]}

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
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

  show :title => :name do
    panel "Actions" do
      render :partial => "admin/users/appraiser_actions", :locals => {:appraiser => appraiser}
    end

    attributes_table do
      row("Name") {appraiser.name}
      row("Email") {appraiser.email}
      row("Created") {appraiser.created_at}
      row("Status") {appraiser.status_as_string}
      row("Paypal Email") {appraiser.paypal_email}
    end

    panel "Address" do
      render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => appraiser.address}
    end

    panel "Additional Information" do
      render :partial=> "admin/users/appraiser_info", :locals => {:extra_info => appraiser.appraiser_extra}
    end

    panel "Trade References" do
      render :partial => "admin/users/trade_references", :locals => {:user => appraiser}      
    end

    panel "Categories" do
      appraiser.skills.each do |skill|
        li skill.category.name  
      end

    end
  end
end
