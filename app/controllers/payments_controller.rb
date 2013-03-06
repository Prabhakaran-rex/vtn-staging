require 'paypal_module'
require 'authorizenet_module'

class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @payment = Payment.new
    @appraisal = Appraisal.find(params[:appraisal_id])
  end

  def create
    @appraisal = Appraisal.find(params[:payment][:appraisal_id])

    if @appraisal.payed?
      flash[:notice] = "Cannot process: previous payment exists"
      redirect_to payments_path
    end

    credit_card = create_credit_card(params[:payment])
    payment_response  = AuthorizenetModule::PayGateway.new.charge(credit_card, create_billing_address(params[:payment]))

    if payment_response.success?
      Payment.add_payment(payment_response.authorization, credit_card.number[-4,4], credit_card.amount/100, current_user.id, @appraisal.id)
      @appraisal.pay_and_notify!

      respond_to do |format|
        flash[:payment_completed] = @appraisal.id
        format.html { redirect_to appraisal_path(@appraisal) }
        format.xml  { render :xml => @appraisal, :status => :created, :location => @appraisal }
      end
    else
      flash[:notice] = "Declined (#{payment_response.params['response_code']}-#{payment_response.params['response_reason_code']}) : #{payment_response.message}"
      redirect_to payments_path(:appraisal_id => @appraisal)
    end
  end

  private
  def create_credit_card(ccparam)
    credit_card = Hash.new
    credit_card[:number] = ccparam[:number]
    credit_card[:cvv] = ccparam[:cvv]
    credit_card[:expmon] = ccparam[:expmon]
    credit_card[:expyear] = ccparam[:expyear]
    credit_card[:name] = current_user.name
    credit_card[:amount]  = PAYMENT_PLAN[ @appraisal.selected_plan-1 ]*100
    return Payment::CreditCard.new(credit_card)
  end

  def create_billing_address(ccparam)
    billing_address = Hash.new
    billing_address[:address] = ccparam[:address]
    billing_address[:company] = ccparam[:company]
    billing_address[:phone] = ccparam[:phone]
    billing_address[:zip] = ccparam[:zip]
    billing_address[:city] = ccparam[:city]
    billing_address[:country] = ccparam[:country]
    billing_address[:state] = ccparam[:state]
    return Payment::BillingAddress.new(billing_address)
  end
end
