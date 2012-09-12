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
end
