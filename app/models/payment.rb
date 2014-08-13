class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :appraisal

  attr_accessor :number, :cvv, :expmon, :expyear
  attr_accessor :address, :company, :phone, :zip, :city, :country, :state
  attr_accessible :appraisal_id, :user_id

  has_one :coupon
  accepts_nested_attributes_for :coupon
  attr_accessor :coupon_attributes
  validates_presence_of :appraisal_id
  validates_presence_of :user_id


  class << self
    def get_paypal_credential
      return {:login => PAYMENT_VARS[Rails.env]['paypal']['login'], :password => PAYMENT_VARS[Rails.env]['paypal']['password'], :signature => PAYMENT_VARS[Rails.env]['paypal']['signature']}
    end

    def get_authorizenet_credential
      return {:login => PAYMENT_VARS[Rails.env]['authorizenet']['login'], :password => PAYMENT_VARS[Rails.env]['authorizenet']['password']}
    end
    
    def get_freshbook_auth
      FreshBooks::Client.new(PAYMENT_VARS[Rails.env]['freshbook']['login'], PAYMENT_VARS[Rails.env]['freshbook']['password'])
    end

    def add_payment(auth_code, ccnum, amount, user_id, appraisal_id)
      payment =  Payment.find_by_appraisal_id(appraisal_id)
      payment = self.new if payment.nil?
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
    
    def export_to_freshbook(params,appraisal)
      freshbook = get_freshbook_auth
      client = User.where(:vendor_token => params["vendor"]).first 
      return {:status => false , :message => "Vendor not found!"} if client.blank?
      exiting_invoice = get_draft_invoice_for_current_month(client.client_id, freshbook) unless client.blank?
      if exiting_invoice.blank?
        create_invoice_to_freshbook(client.client_id,appraisal, params["company_name"]) unless client.blank?
      else
        add_item_to_invoice(exiting_invoice,appraisal)
      end
    end 
    
    def create_invoice_to_freshbook(client_id,appraisal,company)
      freshbook = get_freshbook_auth
      response = freshbook.invoice.create(:invoice => {
                :client_id     => client_id.to_i,
                :status        => 'draft',
                :date          => Date.today,
                :notes         => 'Due upon receipt.',
                :currency_code => 'USD',
                :terms         => 'Payment due in 30 days.',
                :organization  =>  company,
                :lines => [{ :line => {
                               :name         => appraisal.title,
                               :description  => appraisal.name,
                               :unit_cost    => PAYMENT_PLAN[appraisal.selected_plan-1],
                               :quantity     => 1
                             }}]})
      unless response["error"].blank?
        logger.error response["error"]
        return {:status => false , :message => response["error"]}
      else
       appraisal.update_column(:invoice_id, response["invoice_id"])
       return {:status => true , :message => "Congratulations your item has been submitted for valuation! You'll be redirected to our home page in a couple of seconds"}
      end
    end
  
    def add_item_to_invoice(invoice_id,appraisal)
      freshbook = get_freshbook_auth
      response = freshbook.invoice.lines.add(:invoice_id => invoice_id, :lines => {:line => {:name => appraisal.title, :description => appraisal.name, :unit_cost => PAYMENT_PLAN[appraisal.selected_plan-1], :quantity => 1, :type => "Item"}})
      unless response["error"].blank?
        logger.error response["error"]
        return {:status => false , :message => response["error"]}
      else
        appraisal.update_column(:invoice_id, invoice_id)
        return {:status => true , :message => "Congratulations your item has been submitted for valuation! You'll be redirected to our home page in a couple of seconds"}
      end
    end
  
    def get_draft_invoice_for_current_month(client_id, freshbook)
      invoice_id = ""
      list = freshbook.invoice.list(:client_id => client_id, :status => "draft", :date_from => Date.today.beginning_of_month.to_s, :date_to => Date.today.end_of_month.to_s) 
      if list["error"].blank? &&  !list["invoices"]["invoice"].blank?
        invoice_id = if list["invoices"]["total"] == "1" 
                        list["invoices"]["invoice"]["invoice_id"]
                      else
                        list["invoices"]["invoice"][0]["invoice_id"]
                      end
      end
      return invoice_id
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
