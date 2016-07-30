class RegistrationsController < Devise::RegistrationsController

  def create
    # TODO This should be in the model
    params["user"]["status"] = params["user"]["role"] == "customer" ? EAUserStatusConfirmed : EAUserStatusPending
    super
  end

  def after_sign_up_path_for(resource)
    if resource.is_appraiser?
      appraiser_steps_path
    else
      after_sign_in_path_for(resource)
    end
  end

end
