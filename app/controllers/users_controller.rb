class UsersController < ApplicationController

  before_filter :rename_params
  before_filter :get_user, :except => [:facebook_login, :save_signature, :save_avatar]

  def facebook_login
    redirect_to user_omniauth_authorize_path(:facebook)
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(after_sign_in_path_for(@user), :notice => 'Your profile was successfully updated.') }
      else
        format.html { redirect_to(after_sign_in_path_for(@user), :alert => 'Your profile was not updated. Check the input value you gave is correct.') }
      end
    end
  end

  def get_user
    @user = current_user
    redirect_to root_path if @user.nil?# || @user.role != "admin"
  end

  def update_appraiser_status
    statusHash = Hash["Reject" => EAUserStatusRejected, "Approve" => EAUserStatusConfirmed, "Reapply" => EAUserStatusPending]
    if current_user.admin?
      u = User.find(params[:user])
      status = statusHash[params[:status]]
      u.status = status unless status.nil?
      if u.save
        message = Message.new(:name => u.name, :email => u.email)
        UserMailer.notify_appraiser_of_application_result(u,message,params[:reason], params[:comments]).deliver unless u.status == EAUserStatusPending
      end
    end
    redirect_to root_path
  end

  def save_json_signature
    u = Appraiser.find(current_user)
    u.appraiser_extra.signature_json = params.except(:controller, :action, :user).to_json
    u.signature = nil
    render :json => u.save
  end

  def new_avatar
    @user = current_user
  end

  def save_avatar
    @user = User.find(current_user)
    @user.avatar = params[:user][:avatar]

    if @user.save
      respond_to do |format|
        format.html # new.html.erb
    end
    else
      render new_avatar
    end
  end

  def crop_avatar
    @user = User.find(current_user)
    if (params[:user])
      @user.crop_avatar_x = params[:user][:crop_avatar_x]
      @user.crop_avatar_y = params[:user][:crop_avatar_y]
      @user.crop_avatar_w = params[:user][:crop_avatar_w]
      @user.crop_avatar_h = params[:user][:crop_avatar_h]
      if @user.save
        flash[:notice] = "Avatar saved succesfully"
        redirect_to :controller => "appraiser_steps", :action => :show, :id => "avatar"
      else
        redirect_to new_avatar, :error => "Unable to save avatar. Please try again"
      end
    end
  end

  def new_signature
    @user = current_user
  end

  def save_signature
    @user = Appraiser.find(current_user)
    @user.signature = params[:user][:signature]

    if @user.save
      respond_to do |format|
        format.html # new.html.erb
    end
    else
      render new_signature
    end
  end

  def crop_signature
    @user = User.find(current_user)
    if (params[:user])
      @user.crop_x = params[:user][:crop_x]
      @user.crop_y = params[:user][:crop_y]
      @user.crop_w = params[:user][:crop_w]
      @user.crop_h = params[:user][:crop_h]
      if @user.save
        flash[:notice] = "Signature saved succesfully"
        redirect_to :controller => "appraiser_steps", :action => :show, :id => "signature"
      else
        redirect_to new_signature, :error => "Unable to save signature. Please try again"
      end
    end
  end
  
   def get_user_by_vendor_token
    @user = User.where(:vendor_token => params[:vendor_id]).first
    unless @user.blank?
      responce = {:name => @user.name, :address => @user.address.try(:address), :city => @user.address.try(:city), :state => @user.address.try(:state), :zip => @user.address.try(:zip)} 
    end
    render :json => responce
  end

  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

end
