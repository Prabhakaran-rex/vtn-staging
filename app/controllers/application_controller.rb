class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_uri # keep first
  before_filter :rename_params
  
  def check_uri
    if /^www/.match(request.host) && (Rails.env == 'staging' || Rails.env == 'production')
      redirect_to request.protocol + request.host_with_port[4..-1] + request.request_uri
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_path, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  def after_sign_in_path_for(resource_or_scope)
    if (current_user.admin?)
      admin_dashboard_path
    elsif(current_user.is_appraiser?)
      dashboard_detail_path
    else
      users_path
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

  protected

  def check_admin
    if current_user.nil? || !current_user.admin?
      redirect_to root_path
    end
  end

  private
  # Added for Devise STI compatibility between Customer and Appraiser
  def rename_params
    self.params[:user] = params[:appraiser] if params[:appraiser]
    self.params[:user] = params[:customer] if params[:customer]
  end

end
