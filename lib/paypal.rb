module Paypal
    class PayGateway
      def initialize
        @logger = Rails.logger
        paypal_credential = Payment.get_paypal_credential
        @login  = paypal_credential[:login]
        @password = paypal_credential[:password]    
        @signature= paypal_credential[:signature] 

      end

      def charge(mycc, ip)
      #raise param.inspect      
      gateway = get_gateway
      amount = mycc.amount
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :name =>  mycc.name,
        :number    => mycc.number,
        :month     => mycc.expmon,
        :year      => mycc.expyear,
        :verification_value => mycc.cvv)
      
      if credit_card.valid?
        # Capture $10 from the credit card
        #authorize, capture
        #refund()
        response = gateway.purchase(amount, credit_card, {:ip => ip})

        if response.success?
          return true, response.authorization
        else
          if response.message
            return false, response.message
          else
            return false, "Tansaction declined"
          end
        end
      else 
        return false, "Invalid credit card"
      end               
    end
    
    def authorize(mycc, ip)            
      gateway = get_gateway
      amount = mycc.amount
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :name =>  mycc.name,                      
        :number    => mycc.number,
        :month     => mycc.expmon,
        :year      => mycc.expyear,
        :verification_value => mycc.cvv)
      
      
      if credit_card.valid?
        response = gateway.authorize(amount, credit_card, {:ip => ip})

        if response.success?
          return true, response.authorization
        else
          if response.message            
            return false, response.message
          else
            return false, "Tansaction declined"
          end
        end
      else 
        return false, "Invalid credit card"
      end               
    end

    def refund(amount, auth_code)
      gateway = get_gateway

      response = gateway.refund(amount, auth_code)
      if response.success?
        return true, response.authorization
      else
        if response.message
          return false, response.message
        else
          return false, "Tansaction declined"
        end
      end
    end

    
    def get_gateway
      gateway = ActiveMerchant::Billing::PaypalGateway.new(
       :login     => @login,
       :password  => @password,
       :signature => @signature)
      return gateway   
    end
  end
end
