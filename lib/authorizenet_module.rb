module AuthorizenetModule
    class PayGateway
      def initialize
        # Transaction Key: 4wugYeKPq29365bk API_login = 4A4b8SXUt6M
        @logger = Rails.logger
        authorizenet_credential = Payment.get_authorizenet_credential
        @login  = authorizenet_credential[:login]
        @password = authorizenet_credential[:password]
      end

      def charge(mycc, billing_address)
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
        response = gateway.purchase(amount, credit_card, {:billing_address => {:zip => "46282"}})
        raise response.inspect
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
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
       :login     => @login,
       :password  => @password,
       :test => true)
      return gateway
    end
  end
end

