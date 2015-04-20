class HomeController < ApplicationController
  before_filter :authenticate_user!, :only => :fee_schedule

  # Home Page
  def index
    @user = User.new
    @featured_coupon = Coupon.get_featured
    flash.keep
    return redirect_to get_index_for_user_type(current_user) unless current_user.nil?
  end

  def unsubscribe
    token = params[:token]
    # decrypt token get user_id
    crypt = ActiveSupport::MessageEncryptor.new(Devise.secret_key)
    user_id = crypt.decrypt_and_verify(token)
    user =  User.find(user_id) rescue nil
    if user
      user.is_deny_email = true
      user.save
      redirect_to(root_path, :notice => ' You have successfully unsubscribed from our reminder for your uncompleted appraisal.')
    else
      render :file => "#{Rails.root}/public/422.html", :status => 422, :layout => false
    end
  end

  # Terms and Conditions
  def terms
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "terms_of_service"
      end
    end
  end

  # Privacy Policy
  def privacy
    render cms_page: '/privacy-policy'
  end

  # How it works
  def how
    @role = params[:role]
  end

  # Become an Appraiser page
  def become
    render cms_page: '/become'
  end

  # Appraiser code of Ethics
  def ethics
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "code_of_ethics"
      end
    end
  end

  # Determining Value
  def determining
    render cms_page: '/determining'
  end

  # Limiting Conditions and Extraordinary Assumptions
  def limiting
    render cms_page: '/limiting'
  end

  def what_makes
    render cms_page: '/what_makes'
  end

  def fee_schedule
    render cms_page: '/fee-schedule'
  end

  def uspap_compliance
    render cms_page: '/uspap-compliance'
  end

  # Examples of supplementary information
  def appraisal_body_restricteduse_USPAP_compliant_no
    render cms_page: '/appraisal-body-restricteduse-uspap-compliant-no'
  end

  def appraisal_body_restricteduse_USPAP_compliant_yes
    render cms_page: '/appraisal-body-restricteduse-uspap-compliant-yes'
  end

  def appraisal_body_summary_forselling_USPAP_compliant_no
    render cms_page: '/appraisal-body-summary-forselling-uspap-compliant-no'
  end

  def appraisal_body_summary_forselling_USPAP_compliant_yes
    render cms_page: '/appraisal-body-summary-forselling-uspap-compliant-yes'
  end

  def cost
    render cms_page: '/cost-of-appraisals'
  end

  def testimonials
  end

  def stores
  end

  def roadshows
  end

  def salvages
  end

  def rare_books
  end
  
  def sports_memorabilia
  end
  
  def affiliate
  end

  def appraisal_provider_agreement
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "appraisal_provider_agreement"
      end
    end
  end

  def blog_redirect
    url = params[:slug] ? "http://blog.valuethisnow.com/posts/#{params[:slug]}" : "http://blog.valuethisnow.com"
    redirect_to url
  end

  def using_online_appraisals
    render cms_page: '/using-online-appraisals'
  end

  def cost_of_appraisals
    render cms_page: '/cost-of-appraisals'
  end


end
