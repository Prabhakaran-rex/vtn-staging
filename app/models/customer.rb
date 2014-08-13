class Customer < User

  alias_attribute :user_id, :id

  has_one :customer_extra
  accepts_nested_attributes_for :customer_extra
  after_create :create_customer_extra
  attr_accessible :customer_extra_attributes
  devise :omniauthable
  after_update :generate_token 


  def generate_token
    if is_partner == true && vendor_token.blank?
      vendor_token = loop do
        random_token = SecureRandom.urlsafe_base64
        break random_token unless Customer.exists?(vendor_token: random_token)
      end
      save(:validate => false)
      create_client_to_freshbook
    end
  end
 
  def create_client_to_freshbook()
    freshbook = Payment.get_freshbook_auth
    response = freshbook.client.create(:client => { :first_name => "ddddd", 
                                                    :last_name => "ddd",
                                                    :organization => "complany",
                                                    :email => "fgdfg@mailinator.com",
                                                    :P_street1 => "",
                                                    :P_street2 => "",
                                                    :P_city => "",
                                                    :P_state => "",
                                                    :P_country => "",
                                                    :P_code => ""
                                                  })
    unless response["error"].blank?
      logger.error response["error"]
    else
      self.update_column(:client_id, response["client_id"])
    end
  end
  
  private
  def create_customer_extra
    y = CustomerExtra.new(); y.customer_id = self.id;
    y.save(:validate => false)
  end
end
