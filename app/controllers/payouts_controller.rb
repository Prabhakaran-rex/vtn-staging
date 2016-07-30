class PayoutsController < ApplicationController
  before_filter :authenticate_admin_user!
  
  def create
  	credentials = Payment.get_paypal_credential
  	environment = ActiveMerchant::Billing::Base.mode == :test ? :sandbox : :production
  	@paypal = Paypal.new(credentials[:login], credentials[:password], credentials[:signature], environment)

  	@payouts = Payout.find_all_by_id(params[:payouts])

  	@paypal_payments = []
  	unless @payouts.empty?
  		@payouts.each do |payout|
  			unless payout.status == EAPayoutCompleted
	  			p = PayPalPayment.new()
	  			p.email = payout.appraiser.paypal_email
	  			p.unique_id = "#{payout.appraisal_id}-#{payout.appraiser_id}-#{Time.now.to_i}"
	  			p.amount = "#{view_context.number_with_precision(payout.amount, :precision => 2)}"
	  			p.note = "[Value This Now] sent a payment"
	  			@paypal_payments << p
	  		end
  		end
  		@result_hash = @paypal.do_mass_payment(@paypal_payments, "Payment from Value This Now")
  		@result = @result_hash["ACK"] == "Success"
  		if @result
  			@payouts.each {|p| p.status = EAPayoutCompleted; p.save}
		end
  	end
  end
end
