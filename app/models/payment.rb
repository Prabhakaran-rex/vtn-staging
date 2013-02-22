class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appraisal
  
  attr_accessor :number, :cvv, :expmon, :expyear
  attr_accessor :address, :company, :phone, :zip, :city, :country, :state

  
      @paypal_test = { :login => "khw212_1338861554_biz_api1.gmail.com",
                       :password => "1338861588",
                       :signature => "A6aKY1rdzYKveggqS0dCSlcOacTKABO0H79hKoBZiQlZDjaOoXvAOJFX"                 
                      }
      @paypal_live = { :login => "rjohnston_api1.colosses.com",
                       :password => "BAT9ZE4X6EAXU46Q",
                       :signature => "ABwmBAIEJPBtRUnk9k-iMfCgx5nrAMrnY9L1hhyI4NzMx5OtLtkrsOmr"                 
                      }  
      
      @authorizenet_test = { :login => "4A4b8SXUt6M", :password => "4wugYeKPq29365bk"}
      @authorizenet_live = { :login => "4A4b8SXUt6M", :password => "4wugYeKPq29365bk"}
      #paypal test
      #Visa       4730349762398535
      #Exp Date:  6/2017       
                        
  class << self
    def get_paypal_credential
      if ActiveMerchant::Billing::Base.mode == :test
          return @paypal_test
       else
          return @paypal_live
       end
    end

    def get_authorizenet_credential
      if ActiveMerchant::Billing::Base.mode == :test
        return @authorizenet_test
      else
        return @authorizenet_live
      end
    end
    
    def add_payment(auth_code, ccnum, amount, user_id, appraisal_id)
      payment = self.new
      payment.user_id = user_id
      payment.appraisal_id = appraisal_id         
      payment.amount = amount
      payment.is_charged = true
      payment.auth_code = auth_code
      payment.ccnum = ccnum[ccnum.length-4, 4]
      payment.save
    end
    
    def is_payment_exists?(appraisal_id)
      payment = self.find_by_appraisal_id(appraisal_id)
      return payment != nil
    end
    
    def find_by_appraisal_id(appraisal_id)
      where("appraisal_id = ?", appraisal_id).first
    end
  end
  
  class CreditCard  
    attr_accessor :number, :cvv, :expmon, :expyear, :name, :amount 
    
    def initialize(number, cvv, expmon, expyear, name, amount)
      @logger = Rails.logger
      @number = number
      @cvv = cvv
      @expmon = expmon
      @expyear = expyear
      @name = name
      @amount = amount
      
      if  @number.nil? or @number.length<15 or   
          @cvv.nil? or @cvv.length<3 or          
          @expmon.nil? or @expmon.length<1 or
          @expyear.nil? or @expyear.length<2
          @amount.nil? or @amount<1
          @name.nil? or @name.length<3
          
          @logger.error("Invalid credit card")
      end
    end    
    
  end

  class BillingAddress
    attr_accessor :address, :company, :phone, :zip, :city, :country, :state

    def initialize(address, company, phone, zip, city, country, state)
      @address = address
      @company = company
      @phone = phone
      @zip = zip
      @city = city
      @country = country
      @state = state
    end
  end
  
end
