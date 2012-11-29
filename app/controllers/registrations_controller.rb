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

   def build_resource(hash=nil, resource_type = nil)
    hash ||= resource_params || {}
    if resource_type
      self.resource = resource_type.constantize.new_with_session(hash, session)
    else
    self.resource = resource_class.new_with_session(hash, session)
    end
  end
end