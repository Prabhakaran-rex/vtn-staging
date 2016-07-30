require 'complaints'
class ContactController < ApplicationController
	def new
		@message = Message.new
		@role = current_user.type.downcase if current_user
	end

	def create
		@message = Message.new(params[:message])

		if @message.valid?
      if !current_user
				mailer_method = "contact_us"
      elsif current_user.is_appraiser?
				mailer_method = "appraiser_support"
			elsif current_user.is_customer?
				mailer_method = "user_support"
			else
				mailer_method = "contact_us"
			end
			eval "UserMailer.#{mailer_method}(@message).deliver"
			redirect_to(root_path, :notice => "Thank you, your message was sent, someone should be in contact shortly.")
		else
      flash[:alert] = "Please fill all fields."
			render :new
		end
	end

	def complaint
		@user = current_user
		lighthouse = TaskMapper.new(TASK_MAPPER[Rails.env]['provider'], {:token => TASK_MAPPER[Rails.env]['token'], :account => TASK_MAPPER[Rails.env]['account']})
		project =  lighthouse.project.find(TASK_MAPPER[Rails.env]['project_id'])
	end

	def tickets
		@user = current_user
		@ticketConnector = Complaints::Lighthouse.new()
		@tickets = @user.nil? ? [] : current_user.tickets
	end

	def ticket
		@user = current_user
		@ticket = Ticket.new(:user_id => current_user.id)
		@appraisals = Appraisal.where("created_by =? or assigned_to = ? ",current_user, current_user).order("id ASC")
	end

	def ticket_create
		@user = current_user
		@ticketConnector = Complaints::Lighthouse.new()
		a = Appraisal.find(params[:ticket][:appraisal_id])
		body = "Appraisal: #{a.id}-#{a.title}\n"
		body += "User : #{current_user.id} #{current_user.name} #{current_user.email}\n"
		body += "Comments : #{params[:ticket]['description']}"
		@ticketConnector.addTicket(params[:ticket]['title'], body, params[:ticket]['appraisal_id'], current_user.id)
		redirect_to(tickets_path, :notice => "Ticket created successfully")
	end

	def show
		@user = current_user
		@ticket = Ticket.where('id = ? and user_id =? ', params[:id], current_user.id).first
		unless @ticket.nil?
			ticketConnector = Complaints::Lighthouse.new()
			@tmTicket = ticketConnector.getTicket(@ticket) 
			@comments = ticketConnector.getComments(@ticket)
		end
	end
end
