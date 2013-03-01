module AuthorizenetModule
  class PayGateway
    def charge(mycc, billing_address)
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :name =>  mycc.name,
        :number    => mycc.number,
        :month     => mycc.expmon,
        :year      => mycc.expyear,
        :verification_value => mycc.cvv)
      get_gateway.purchase(mycc.amount, credit_card, {:billing_address => billing_address.as_json})
    end

    def get_gateway
      authorizenet_credential = Payment.get_authorizenet_credential
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new(
        :login     => authorizenet_credential[:login],
        :password  => authorizenet_credential[:password],
        :test => false)
      return gateway
    end
  end
end

