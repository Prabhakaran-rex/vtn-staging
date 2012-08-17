class AppraiserAccessTokensController < ApplicationController
  before_filter :check_admin, :except => [:show]

  def show
    unless current_user.nil?
      flash[:notice] = "Already registered, you need to sign out to register a new user"
      redirect_to after_sign_in_path_for(current_user)
      return
    end

    @token = AppraiserAccessToken.find_by_token(params[:id])
    @user = User.new
    @user.email = @token.email

  end

  def create
    @appraiser_access_token = AppraiserAccessToken.create(params[:appraiser_access_token])
    if @appraiser_access_token.valid?
      current_user.invite_appraiser_by_email(@appraiser_access_token)
       flash[:notice] = "Invite sent to " << @appraiser_access_token.email
    else
      flash[:notice] = @appraiser_access_token.errors
    end

    redirect_to admin_dashboard_path
  end

end
