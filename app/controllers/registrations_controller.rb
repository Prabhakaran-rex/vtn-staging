class RegistrationsController < Devise::RegistrationsController
  def new
    @role = params[:role] || "customer"
    super
  end

  def create
    # TODO This should be in the model
    params["user"]["status"] = params["user"]["role"] == "customer" ? EAUserStatusConfirmed : EAUserStatusPending 
    super
  end

  def after_sign_up_path_for(resource)
    if resource.role == "appraiser"
      appraiser_steps_path
    else
      after_sign_in_path_for(resource)
    end
  end

  # Monkeypatched so the Edit Login tab plays nice with the Wicked gem (for the Appraiser Steps)
  def wizard_path(goto_step = nil, options = {})
    options = { :controller => :appraiser_steps,
                :action     => 'show',
                :id         => goto_step || params[:id],
                :only_path  => true
               }.merge options
    url_for(options)
  end
end