class RegistrationsController < Devise::RegistrationsController
  def new
    @role = "user"
    super
  end

  def new_appraiser
    @role = "appraiser"
    resource = build_resource({})
    respond_with resource
  end

  def create
    if params["user"]["role"] == "appraiser"
      Rails.logger.debug "*** This is an appraiser"
      appraiser_access_token = AppraiserAccessToken.find_by_token(params["access_token"])
      if (appraiser_access_token.nil? || appraiser_access_token.user)
        Rails.logger.debug "*** Wrong token"
        build_resource
        clean_up_passwords(resource)
        flash.now[:alert] = "There was an error with the access token. Please re-enter the token."      
        render :new_appraiser
      else
        super
        current_user.consume_appraiser_access_token(appraiser_access_token) if current_user
      end
    else
      super
    end
  end
end