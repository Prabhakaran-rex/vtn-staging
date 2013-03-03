### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Testy McUserton", :email => "example@purplecowwebsites.com",
                 :password => "Plea$e1234", :password_confirmation => "Plea$e1234", :username => "test_user" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def create_omniauth_user(params = nil)
  facebook_id = params[:facebook_id] || "12345"
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email], facebook_id: facebook_id )
end

def create_admin
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
  @user.add_role :superadmin
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up(type = "Customer")
  delete_user
  visit "/#{type.downcase.pluralize}/sign_up"
  within("#new_#{type.downcase}") do
    fill_in "#{type.downcase}_name", :with => @visitor[:name]
    fill_in "#{type.downcase}_email", :with => @visitor[:email]
    fill_in "#{type.downcase}_username", :with => @visitor[:username]
    fill_in "#{type.downcase}_password", :with => @visitor[:password]
    fill_in "#{type.downcase}_password_confirmation", :with => @visitor[:password_confirmation]
    check('Agree to terms of service')
    click_button "Sign up"
  end
  find_user
end

def sign_in
  visit '/users/sign_in'
  within('#new_user') do
    fill_in "user_login", :with => @visitor[:email]
    fill_in "user_password", :with => @visitor[:password]
    click_button "Sign in"
  end
end

def set_omniauth(opts = {})
  OmniAuth.config.test_mode = true

  OmniAuth.config.add_mock(:facebook, {
    :uid => '23456',
    :info => {
      :nickname => "fooman",
      :email => "example-fb@purplecowwebsites.com",
      :first_name => 'Foo',
      :last_name => 'Man'
    },
    :extra => {
    :raw_info => {
      :email => "example-fb@purplecowwebsites.com"
    }
    }
    }
  )
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_out'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as a "(.*?)" user$/ do |provider|
  create_omniauth_user({:facebook_id => "12345" })
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

Given /^I am an administrator$/ do
  create_admin
  sign_in
end

Given /^I am not an administrator$/ do
  create_user
  sign_in
end

Given /^I have users named (.+)$/ do |names|
  names.split(', ').each do |name|
    user = FactoryGirl.create(:user, name: name, email:"#{name.downcase}@somewhere.com")
  end
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "please123")
  sign_up
end

When /^I sign up without a name$/ do
  create_visitor
  @visitor.merge(:name => "")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  page.all('a', :text => "Edit account")[0].click
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I click on the Admin button$/ do
  within "#visible-desktop-navbar" do
    click_link "Admin Panel"
  end
end

When /^I click on the "(.*?)" button$/ do |text|
  page.all('a', :text => text)[0].click
end

When /^I sign in as a user with "(.*?)"$/ do |provider|
  set_omniauth
  visit "/customers/auth/#{provider.downcase}"
end

When /^I enter an email address$/ do
  within('#new_user') do
    fill_in "user_email", :with => "omniauth@somewhere.com"
  end
  click_button "Sign up"
end

When /^I edit "(.*?)" with "(.*?)" inside my profile$/ do |field, value|
  within "#visible-desktop-navbar" do
    click_link "Edit account"
  end
  fill_in "user_#{field}", :with => value
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I go to the list of users$/ do
  visit users_path
end

When /^I visit the sign in path$/ do
  visit '/users/sign_in'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_button "Signout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Log In"
  page.should_not have_button "Signout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address."
end

Then /^I should see an invalid email message$/ do
  page.should have_css(".email .controls .help-inline", :text => "is invalid")
end

Then /^I should see an email message with "(.*?)"$/ do |message|
  page.should have_css(".email .controls .help-inline", :text => message)
end

Then /^I should see a missing password message$/ do
  page.should have_css(".password .controls .help-inline", :text => "can't be blank")
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_css(".password .controls .help-inline", :text => "doesn't match confirmation")
end

Then /^I should see a mismatched password message$/ do
  page.should have_css(".password .controls .help-inline", :text => "doesn't match confirmation")
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

Then /^I should see a missing name message$/ do
  page.should_not have_content "can't be blank"
end

Then /^I should see the admin dashboard$/ do
  page.should have_content "Dashboard"
end

Then /^I should not see the Admin button$/ do
  page.should_not have_content "Admin Panel"
end

Then /^I should see "(.*?)" button$/ do |text|
  page.should have_css("a", :text => text ) 
end

# Then
Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text 
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should_not have_content text 
end

Then /^I should see a link that goes to "(.*?)"$/ do |target|
  page.should have_xpath("//a[contains(@href,'#{target}')]")
end
