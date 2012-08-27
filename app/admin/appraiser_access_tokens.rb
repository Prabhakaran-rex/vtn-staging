ActiveAdmin.register AppraiserAccessToken do

	index do
		column :id
		column :token
		column :email
		column :name
		column :used_at
		column :created_at
	end

	filter :id
	filter :token
	filter :email
	filter :name
	filter :used_at
	filter :created_at

	form do |f|
    f.inputs "Appraisers Invites" do
      f.input :name
      f.input :email
      f.input :user_id, :as => :hidden, :input_html => {:value => current_user.id}
    end
    f.buttons
  end

  # Redirect to index page (instead of show) to avoid conflict with to_param method in AppraiserAccessToken
  controller do
   def create
     create! do |format|
        format.html { redirect_to admin_appraiser_access_tokens_url }
     end
   end
 end
  
end
