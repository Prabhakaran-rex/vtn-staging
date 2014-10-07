class Users::Admin::DashboardController < ApplicationController
  before_filter :check_admin
  def show
    @appraiser_access_token = AppraiserAccessToken.new
  end

  def appraisers_index
    @users = User.where("role = 'appraiser'").paginate(:page => params[:page], :per_page => params[:per_page] || 100, :order => "created_at DESC")
  end

  def appraisers_invite_index
    @appraiser_access_tokens = AppraiserAccessToken.paginate(:page => params[:page], :per_page => params[:per_page] || 100, :order => "created_at DESC")
  end
end
