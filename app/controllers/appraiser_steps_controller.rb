# Handles the appraiser profile wizard
class AppraiserStepsController < ApplicationController
	include Wicked::Wizard
	steps :personal, :professional, :categories, :preferences, :bank

	def show
		@user = current_user
		render_wizard
	end

	def update
		@user = current_user
		# TODO [slm] Refactor this
		params[:user][:appraiser_info] = Hash.new if params[:user][:appraiser_info].nil?
		current_appraiser_info = @user.appraiser_info.instance_values
		current_appraiser_info.merge!(AppraiserInfo.new(params[:user][:appraiser_info]).instance_values)
		params[:user][:appraiser_info] = AppraiserInfo.new(current_appraiser_info)
		@user.attributes = params[:user]
		render_wizard @user
	end

end
