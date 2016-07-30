class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :rename_params
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path, :alert => exception.message
  end

  def access_denied(exception)
    redirect_to admin_dashboard_path, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  def after_sign_in_path_for(resource_or_scope)
    return session[:user_return_to] if session[:user_return_to]
    
    if (current_user.admin?)
      admin_dashboard_path
    elsif(current_user.is_appraiser?)
      dashboard_detail_path
    else
      appraisals_path
    end
  end

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "This area is restricted to administrators only."
      redirect_to root_path
    end
  end

  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end

  def get_index_for_user_type(user)
    if (user.admin?)
      admin_dashboard_path
    elsif(user.is_appraiser?)
      dashboard_detail_path
    else
      appraisals_path
    end
  end

  protected

  def check_admin
    if current_user.nil? || !current_user.admin?
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  private
  # Added for Devise STI compatibility between Customer and Appraiser
  def rename_params
    self.params[:user] = params[:appraiser] if params[:appraiser]
    self.params[:user] = params[:customer] if params[:customer]
  end

end
