class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appraisal

  attr_accessor :number, :cvv, :expmon, :expyear
  attr_accessor :address, :company, :phone, :zip, :city, :country, :state

  has_one :coupon
  accepts_nested_attributes_for :coupon
  attr_accessor :coupon_attributes


  class << self
    def get_paypal_credential
      return {:login => PAYMENT_VARS[Rails.env]['paypal']['login'], :password => PAYMENT_VARS[Rails.env]['paypal']['password'], :signature => PAYMENT_VARS[Rails.env]['paypal']['signature']}
    end

    def get_authorizenet_credential
      return {:login => PAYMENT_VARS[Rails.env]['authorizenet']['login'], :password => PAYMENT_VARS[Rails.env]['authorizenet']['password']}
    end

    def add_payment(auth_code, ccnum, amount, user_id, appraisal_id)
      payment = self.new
      payment.user_id = user_id
      payment.appraisal_id = appraisal_id
      payment.amount = amount
      payment.is_charged = true
      payment.auth_code = auth_code
      payment.ccnum = ccnum
      payment.save
    end

    def find_by_appraisal_id(appraisal_id)
      where("appraisal_id = ?", appraisal_id).first
    end
  end

  class CreditCard
    attr_accessor :number, :cvv, :expmon, :expyear, :name, :amount 

    def initialize(params)
      @number = params[:number]
      @cvv = params[:cvv]
      @expmon = params[:expmon]
      @expyear = params[:expyear]
      @name = params[:name]
      @amount = params[:amount]
    end

  end

  class BillingAddress
    attr_accessor :address, :company, :phone, :zip, :city, :country, :state

    def initialize(params)
      @address = params[:address]
      @company = params[:company]
      @phone = params[:phone]
      @zip = params[:zip]
      @city = params[:city]
      @country = params[:country]
      @state = params[:state]
    end
  end

end
