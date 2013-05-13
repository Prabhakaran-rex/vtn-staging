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

  factory :coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "fixed"
    expiration_date Time.now+10.days
  end

  factory :fixed_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "fixed"
    expiration_date Time.now+10.days
  end

  factory :percentage_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    expiration_date Time.now+10.days
  end

  factory :unused_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    expiration_date Time.now+10.days
    used_on nil
  end

  factory :used_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    expiration_date Time.now+10.days
    used_on Time.now+2.day
  end
end
