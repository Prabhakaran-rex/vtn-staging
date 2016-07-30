class Customer < User

  alias_attribute :user_id, :id

  has_one :customer_extra
  accepts_nested_attributes_for :customer_extra
  after_create :create_customer_extra
  attr_accessible :customer_extra_attributes
  devise :omniauthable, :omniauth_providers => [:twitter, :facebook, :linkedin]
  after_save :generate_token 


  def generate_token
    if is_partner == true && vendor_token.blank?
        random_token = SecureRandom.urlsafe_base64
        self.vendor_token  = random_token
      save(:validate => false)
      create_client_to_freshbook
    end
  end

  def re_generate_token
    if is_partner == true && !vendor_token.blank?
        random_token = SecureRandom.urlsafe_base64
        self.vendor_token  = random_token
      save(:validate => false)
    end
  end
 
  def create_client_to_freshbook()
    freshbook = Payment.get_freshbook_auth
    address = self.address
    response = freshbook.client.create(:client => { :first_name => self.name, 
                                                    :last_name => "",
                                                    :organization => self.name,
                                                    :email => self.email,
                                                    :p_street1 => address.try(:address),
                                                    :p_street2 => "",
                                                    :p_city => address.try(:city),
                                                    :p_state => address.try(:state),
                                                    :p_country => address.try(:country),
                                                    :p_code => address.try(:zip)
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
