class HomeController < ApplicationController

  # Home Page
  def index
    @user = User.new
    return redirect_to after_sign_in_path_for(current_user) unless current_user.nil?
  end

  # Terms and Conditions
  def terms
    render cms_page: '/terms-and-conditions'
  end

  # What we value
  def categories
    render cms_page: '/categories'
  end

  # Excluded items
  def exclusions
    render cms_page: '/exclusions'
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
    render cms_page: '/ethics'
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

  def appraiser_invite
  end

  def fee-schedule
    render cms_page: '/fee-schedule'
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

  # Begin For future use
  def static1
    render cms_page: '/static1'
  end

  def static2
    render cms_page: '/static2'
  end

  def static3
    render cms_page: '/static3'
  end

  def static4
    render cms_page: '/static4'
  end

  def static5
    render cms_page: '/static5'
  end

  def static6
    render cms_page: '/static6'
  end
  # End For Future Use
end
