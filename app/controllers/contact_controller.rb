class ContactController < ApplicationController
	def new
		@message = Message.new
		@role = current_user.role if current_user
	end

	def create
		@message = Message.new(params[:message])

		if @message.valid?
			role = current_user.role if current_user
			if role == "appraiser"
				mailer_method = "appraiser_support"
			elsif role == "user"
				mailer_method = "user_support"
			else
				mailer_method = "contact_us"
			end
			eval "UserMailer.#{mailer_method}(@message).deliver"
			redirect_to(root_path, flash[:notice] => "Message was successfully sent.")
		else
			flash[:alert] = "Please fill all fields."
			render :new
		end
	end
end
