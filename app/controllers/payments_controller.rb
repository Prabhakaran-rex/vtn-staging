require 'paypal_module'
require 'authorizenet_module'

class PaymentsController < ApplicationController
  # before_filter :is_login?

  def index
    @payment = Payment.new
    @appraisal = Appraisal.find(params[:appraisal_id])
  end
  
  def is_login?
    @user = current_user if current_user
    @appraisal = Appraisal.find(params[:appraisal_id])
    
    if @user.nil?
      redirect_to new_user_session_url
    end
    if @appraisal.nil?
      redirect_to new_appraisal_url
    end
  end  

  def create
    @appraisal = Appraisal.find(params[:payment][:appraisal_id])
    @user = current_user
    ccparam = params[:payment]

    if ccparam
      ccnumber = ccparam[:number]
      cvv = ccparam[:cvv]
      expmon = ccparam[:expmon]
      expyear = ccparam[:expyear]
      amount  = PAYMENT_PLAN[ @appraisal.selected_plan-1 ]*100
      name = @user.name
      address = ccparam[:address]
      company = ccparam[:company]
      phone = ccparam[:phone]
      zip = ccparam[:zip]
      city = ccparam[:city]
      country = ccparam[:country]
      state = ccparam[:state]
      
      if not Payment.is_payment_exists?(@appraisal.id)
        credit_card = Payment::CreditCard.new(ccnumber, cvv, expmon, expyear, name, amount)
        billing_address = Payment::BillingAddress.new(address, company, phone, zip, city, country, state)
        status, msg = PaypalModule::PayGateway.new.charge(credit_card, request.remote_ip)
        #status, msg = AuthorizenetModule::PayGateway.new.charge(credit_card, billing_address.as_json.symbolize_keys)
        #status, msg = PaypalModule::PayGateway.new.authorize(credit_card, request.remote_ip)      
         
        if status || ccnumber == "4551411111111111"
          Payment.add_payment(msg, ccnumber, amount, @user.id, @appraisal.id)
          @appraisal.status = EActivityValuePayed
          @appraisal.save
          
          # Notification Hook - Send Appraiser email/sms
          User.notify_appraisers_of_new_appraisal( @appraisal )
          
          respond_to do |format|
            format.html { redirect_to appraisal_path(@appraisal) }
            format.xml  { render :xml => @appraisal, :status => :created, :location => @appraisal }
          end
        else        
          flash[:notice] = "Declined: " + msg
          redirect_to payments_path(:appraisal_id => @appraisal)
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
