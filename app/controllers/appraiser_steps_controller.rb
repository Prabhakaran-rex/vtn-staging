# Handles the appraiser profile wizard
class AppraiserStepsController < ApplicationController
	include Wicked::Wizard
	steps :personal, :professional, :trade,:categories, :signature,  :bank, :contracts, :preferences

	def show
		@user = current_user
		@trade_reference = TradeReference.new
		case step
			when :signature, :bank
				skip_step if @user.is_customer? || !is_appraiser_confirmed
			when :professional, :categories, :trade, :contracts
				skip_step if @user.is_customer?
			when :preferences
				unless @user.is_customer?
					skip_step if !is_appraiser_confirmed
				end
		end
		@current_step = step
		render_wizard
	end

	def update
		@user = current_user
		@user.attributes = params[:appraiser] || params[:customer]
		render_wizard @user
	end

	protected
	def is_appraiser_confirmed
		current_user.is_appraiser? && current_user.status == EAUserStatusConfirmed
	end 
end
