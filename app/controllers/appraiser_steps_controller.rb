# Handles the appraiser profile wizard
class AppraiserStepsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :set_cache_buster

	include Wicked::Wizard
	steps :personal, :avatar, :professional, :trade, :bank, :signature, :categories, :contracts, :preferences

	def show
		@user = current_user
		@user[:last_step] = params[:id]
		@user.save
		@trade_reference = TradeReference.new
		case step
			when :professional, :signature, :categories, :trade, :contracts, :bank
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
		@user[:last_step] = params[:id]
		render_wizard @user
	end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

	protected
	def is_appraiser_confirmed
		current_user.is_appraiser? && current_user.status == EAUserStatusConfirmed
	end 
end
