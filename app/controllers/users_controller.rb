class UsersController < ApplicationController

  before_filter :get_user, :except => [:facebook_login]

  def index
    @appraisals = Appraisal.where(:created_by => @user.id)

    if @appraisals.empty?
      @appraisal = Appraisal.new
      1.times { @appraisal.photos.build }
    end

    respond_to do |format|
      format.html
    end
  end

  def facebook_login
    redirect_to user_omniauth_authorize_path(:facebook)
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(after_sign_in_path_for(@user), :notice => 'Your profile was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { redirect_to(after_sign_in_path_for(@user), :alert => 'Your profile was not updated. Check the input value you gave is correct.') }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_user
    @user = params[:id].nil? ? current_user : User.find(params[:id])
    redirect_to root_path if @user.nil?# || @user.role != "admin"
  end

end