# Handles the appraiser profile wizard
class AppraiserStepsController < ApplicationController
	include Wicked::Wizard
	steps :personal, :professional, :signature, :categories, :bank, :preferences, :public

	def show
		@user = current_user
		case step
			when :signature, :bank
				skip_step if @user.role == "user" || !is_appraiser_confirmed
			when :professional, :categories
				skip_step if @user.role == "user"
			when :preferences
				skip_step if !is_appraiser_confirmed
		end
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

	protected
	def is_appraiser_confirmed
		current_user.role == 'appraiser' && current_user.status == EAUserStatusConfirmed
	end 
end
