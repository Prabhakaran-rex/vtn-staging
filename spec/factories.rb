FactoryGirl.define do
  sequence(:email){|n| "example#{n}@example.net" }
  sequence(:username) {|n| "test_user_#{n}" }

  factory :user do
    email
    role 'customer'
    name 'Test User'
    username
    status EAUserStatusConfirmed
    password 'Plea$e1234'
    password_confirmation 'Plea$e1234'
    confirmed_at Time.now
    type 'Customer'
  end
end
