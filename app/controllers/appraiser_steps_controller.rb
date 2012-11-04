# Handles the appraiser profile wizard
class AppraiserStepsController < ApplicationController
	include Wicked::Wizard
	steps :personal, :professional, :trade,:categories, :signature,  :bank, :preferences

	def show
		@user = current_user
		@trade_reference = TradeReference.new
		case step
			when :signature, :bank
				skip_step if @user.role == "user" || !is_appraiser_confirmed
			when :professional, :categories, :trade
				skip_step if @user.role == "user"
			when :preferences
				unless @user.role == "user"
					skip_step if !is_appraiser_confirmed
				end
		end
		render_wizard
	end

	def update
		@user = current_user
		@user.attributes = params[:user]
		render_wizard @user
	end

	protected
	def is_appraiser_confirmed
		current_user.role == 'appraiser' && current_user.status == EAUserStatusConfirmed
	end 
end
