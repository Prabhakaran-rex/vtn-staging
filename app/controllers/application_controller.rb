class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_uri # keep first
  
  def check_uri
    if /^www/.match(request.host) && (Rails.env == 'staging' || Rails.env == 'production')
      redirect_to request.protocol + request.host_with_port[4..-1] + request.request_uri
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/404.html", :status => 404 if isProd
    render :file => "#{Rails.root}/public/401.html", :status => 401 unless isProd
  end


  def after_sign_in_path_for(resource_or_scope)
    if (current_user.role == "admin")
      admin_dashboard_path
    elsif(current_user.role == "appraiser")
      appraisals_path

    else
      users_path
    end

  end

  protected

  def check_admin
    if current_user.nil? || current_user.role != "admin"
      redirect_to root_path
    end
  end

end
