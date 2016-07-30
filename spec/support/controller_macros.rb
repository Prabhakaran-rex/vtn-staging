module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  end

  def login_appraiser
    @request.env["devise.mapping"] = Devise.mappings[:appraiser]
    user = FactoryGirl.create(:appraiser)
    user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
  end

  def login_customer
    @request.env["devise.mapping"] = Devise.mappings[:customer]
    user = FactoryGirl.create(:customer)
    user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in user
  end
end
