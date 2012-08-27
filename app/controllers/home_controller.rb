class HomeController < ApplicationController

  # Home Page
  def index
    @user = User.new
    return redirect_to after_sign_in_path_for(current_user) unless current_user.nil?
  end

  # Terms and Conditions
  def terms
  end

  # What we value
  def categories
  end

  # Excluded items
  def exclusions 
  end

  # Privacy Policy
  def privacy
  end

  # How it works
  def how
    @role = params[:role]
  end

  # Become an Appraiser page
  def become
  end

  # Appraiser code of Ethics
  def ethics
  end

  # Determining Value
  def determining
  end

  # Limiting Conditions and Extraordinary Assumptions
  def limiting
  end
end
