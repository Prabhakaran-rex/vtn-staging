module AuthorizenetModule
  class PayGateway
    def process(params)
      appraisal_params = params[:appraisal_params]
      hash = _validate(appraisal: params[:appraisal], appraisal_params: appraisal_params)
      return hash if hash[:status] == false
     credit_card = _create_credit_card(appraisal: params[:appraisal], appraisal_params: appraisal_params)
     _charge(credit_card: credit_card, billing_address: _create_billing_address(payment_attributes: appraisal_params[:payment_attributes]), appraisal: params[:appraisal], coupon:appraisal_params[:payment_attributes][:coupon], email: params[:email])
    end

    private

    def _get_gateway
      authorizenet_credential = Payment.get_authorizenet_credential
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
        :login     => authorizenet_credential[:login],
        :password  => authorizenet_credential[:password],
        :test => ENV['TEST_PAYMENT'])
      return gateway
    end

    def _validate(params)
      appraisal_params = params[:appraisal_params]
      appraisal = params[:appraisal]

      hash = Hash[:status => false, :message => ""]
      if appraisal_params[:payment_attributes][:coupon] && !appraisal_params[:payment_attributes][:coupon].blank? && !Coupon.is_coupon_valid?(appraisal_params[:payment_attributes][:coupon])
        hash[:message] = "Cannot process: Invalid coupon"
        return hash
      end

      coupon = Coupon.find_by_code(appraisal_params[:payment_attributes][:coupon])

      if coupon && !coupon.valid_for_appraisal?(appraisal.selected_plan)
        hash[:message] = "Cannot process: Invalid coupon"
        return hash
      end

      if appraisal.payed?
        hash[:message] = "Cannot process: previous payment exists"
        return hash
      end
      hash[:status] = true
      return hash
    end

    def _create_credit_card(params)
      ccparam = params[:appraisal_params][:payment_attributes]
      credit_card = Hash.new
      credit_card[:number] = ccparam[:number]
      credit_card[:cvv] = ccparam[:cvv]
      credit_card[:expmon] = ccparam[:expmon]
      credit_card[:expyear] = ccparam[:expyear]
      credit_card[:name] = ccparam[:name]
      credit_card[:amount]  = PAYMENT_PLAN[ params[:appraisal].selected_plan-1 ]*100
      credit_card[:has_coupon] = !ccparam[:coupon].blank?
      if credit_card[:has_coupon]
        credit_card[:amount] = Coupon.details_for(ccparam[:coupon]).calculate_discounted_amount(credit_card[:amount]/100)*100
      end
      return Payment::CreditCard.new(credit_card)
    end

    def _create_billing_address(params)
      ccparam = params[:payment_attributes]
      billing_address = Hash.new
      billing_address[:address] = ccparam[:address]
      billing_address[:company] = ccparam[:company] || ""
      billing_address[:phone] = ccparam[:phone] || ""
      billing_address[:zip] = ccparam[:zip]
      billing_address[:city] = ccparam[:city]
      billing_address[:country] = ccparam[:country] || ""
      billing_address[:state] = ccparam[:state]
      return Payment::BillingAddress.new(billing_address)
    end

    def _charge(params)
      mycc = params[:credit_card]
      hash = Hash[:status => false, :message => ""]

      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :name =>  mycc.name,
        :number    => mycc.number,
        :month     => mycc.expmon,
        :year      => mycc.expyear,
        :verification_value => mycc.cvv)
      payment_response = _get_gateway.purchase(mycc.amount.to_i, credit_card, {:billing_address => params[:billing_address].as_json, :email => params[:email]})
      if payment_response.success?
        appraisal = Appraisal.find(params[:appraisal])
        Payment.add_payment(payment_response.authorization, mycc.number[-4,4], mycc.amount/100, appraisal.created_by, appraisal.id)
        coupon = Coupon.find_by_code(params[:coupon])
        if coupon
          coupon.apply!(appraisal)
        end
        appraisal.pay_and_notify!
        hash[:status] = true
        hash[:message] = "Congratulations your item has been submitted for valuation! You'll be redirected to our home page in a couple of seconds"
      else
        hash[:message] = _pretty_message(payment_response)
      end
      return hash
    end

    def _pretty_message(payment_response)
      "Declined (#{payment_response.params['response_code']}-#{payment_response.params['response_reason_code']}) : #{payment_response.message}"
    end
  end
end

module ActiveMerchant
   module Billing
     class AuthorizeNetGateway < Gateway
       private
        def add_customer_data(post, options)
        if options.has_key? :email
          post[:email] = options[:email]
          #post[:email_customer] = false
        end

        if options.has_key? :customer
          post[:cust_id] = options[:customer] if Float(options[:customer]) rescue nil
        end

        if options.has_key? :ip
          post[:customer_ip] = options[:ip]
        end

        if options.has_key? :cardholder_authentication_value
          post[:cardholder_authentication_value] = options[:cardholder_authentication_value]
        end

        if options.has_key? :authentication_indicator
          post[:authentication_indicator] = options[:authentication_indicator]
        end
      end
     end
   end
end
