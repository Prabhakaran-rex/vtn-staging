class AppraiserController < ApplicationController

  before_filter :check_appraiser

  def show
    @user.photos.build if @user.photos.size == 0
  end

  def check_appraiser
    @user = current_user if current_user && current_user.role == "appraiser"
    if @user.nil?
      redirect_to root_path
    end
  end

end


