require 'paypal'

class PaymentsController < ApplicationController
  before_filter :is_login?

  def index
    Rails.logger.debug "*** Inside payments#index where params is #{params.to_json}"
    @payment = Payment.new
    @appraisal = Appraisal.find(params[:appraisal_id])
  end
  
  def is_login?
    @user = current_user if current_user
    @appraisal = Appraisal.find(session[:new_appraisal])
    
    if @user.nil?
      redirect_to new_user_session_url
    end
    if @appraisal.nil?
      redirect_to new_appraisal_url
    end
  end  

  def create
    
    ccparam = params[:payment]
    
    if ccparam
      ccnumber = ccparam[:number]
      cvv = ccparam[:cvv]
      expmon = ccparam[:expmon]
      expyear = ccparam[:expyear]
      amount  = PAYMENT_PLAN[ @appraisal.selected_plan ]
      name = @user.name
      
      if not Payment.is_payment_exists?(@appraisal.id)
        credit_card = Payment::CreditCard.new(ccnumber, cvv, expmon, expyear, name, amount)
        #status, msg = Paypal::PayGateway.new.charge(credit_card, request.remote_ip)
        status, msg = Paypal::PayGateway.new.authorize(credit_card, request.remote_ip)      
        #status, msg = Paypal::PayGateway.new.refund(amount, auth_code)
         
        if status
          Payment.add_payment(msg, ccnumber, amount, @user.id, @appraisal.id)
          @appraisal.status = EActivityValuePayed
          @appraisal.save
          
          # Notification Hook - Send Appraiser email/sms
          User.notify_appraisers_of_new_appraisal( @appraisal )
          flash[:notice] = "Congratulations your item has been submitted for a certified USPAP valuation!"
          flash[:title]  = "Thank You!"
          
          respond_to do |format|
            format.html { redirect_to appraisal_path(@appraisal) }
            format.xml  { render :xml => @appraisal, :status => :created, :location => @appraisal }
          end
        else        
          flash[:notice] = "Declined: " + msg
          redirect_to payments_path
        end
      else
        flash[:notice] = "Cannot process: previous payment exists"
        redirect_to payments_path
      end
    else
      flash[:notice] = "System error: invalid input params"
      redirect_to payments_path       
    end

  end

  private 
  
  
  def is_payment_exist(appraisal_id)
       
  
  end
  
end
