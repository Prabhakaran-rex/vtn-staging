class RegistrationsController < Devise::RegistrationsController
  def new
    @role = "user"
    super
  end

  def new_appraiser
    @role = "appraiser"
    if params[:token]
      @theToken = AppraiserAccessToken.find_by_token(params[:token])
      @email = @theToken.email
      @token = @theToken.token
      @name = @theToken.name
    end
    resource = build_resource({})
    respond_with resource
  end

  def create
    if params["user"]["role"] == "appraiser"
      appraiser_access_token = AppraiserAccessToken.find_by_token(params["user"]["access_token"])
      if (appraiser_access_token.nil? || appraiser_access_token.used_at.nil?)
        build_resource
        clean_up_passwords(resource)
        flash.now[:alert] = "There was an error with the access token. Please re-enter the token."      
        render :new_appraiser
      else
        super
        current_user.consume_appraiser_access_token(appraiser_access_token) if current_user
      end
    else
      # params["user"]["role"] = "user"
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.role == "appraiser"
      appraiser_steps_path
    else
      after_sign_in_path_for(resource)
    end
  end

end