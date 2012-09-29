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

  # TODO If there's an error with any of the fields, the appraiser is redirected to the User sign up page instead of the Appraiser sign up
  def create
    if params["user"]["role"] == "appraiser"
      if !params["user"]["access_token"].empty?
        appraiser_access_token = AppraiserAccessToken.find_by_token(params["user"]["access_token"])
        if (appraiser_access_token.nil? || !appraiser_access_token.used_at.nil?)
          build_resource
          clean_up_passwords(resource)
          flash.now[:alert] = "There was an error with the access token. Please re-enter the token."      
          render :new_appraiser
        end
      else
        super
        if current_user
          current_user.consume_appraiser_access_token(appraiser_access_token) unless appraiser_access_token.nil?
          current_user.status = EAUserStatusPending
          current_user.save
        end
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