FactoryGirl.define do
  sequence(:email){|n| "wapankh+#{n}@gmail.com" }
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

  factory :customer do
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

  factory :appraiser do
    email
    role 'appraiser'
    name 'Test Appraiser'
    username
    status EAUserStatusConfirmed
    password 'Plea$e1234'
    password_confirmation 'Plea$e1234'
    confirmed_at Time.now
    type 'Appraiser'
  end

  factory :appraisal do
    title "An appraisal"
    created_by {(Customer.first || FactoryGirl.create(:customer)).id}
    selected_plan EAAppraisalTypeShortRestricted
  end

  factory :payout do
    appraisal {Appraisal.first || FactoryGirl.create(:appraisal)}
    appraiser {Appraiser.first || FactoryGirl.create(:appraiser)}
    amount 1.00
  end

  factory :payment do
    appraisal {Appraisal.first || FactoryGirl.create(:appraisal)}
    user {Customer.first || FactoryGirl.create(:customer)}
  end

  factory :promotion do
    name "The Promotion"
    description "A promotion"
  end

  factory :coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "fixed"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    description "A coupon"
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
  end

  factory :fixed_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "fixed"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
  end

  factory :percentage_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
  end

  factory :unused_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    used_on nil
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
  end

  factory :used_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "percentage"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    used_on Time.now+2.day
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
  end

  factory :single_product_coupon, class: Coupon do
    code "abcd1234abcd1234"
    discount "10"
    discount_type "fixed"
    start_date Time.now-1.day
    expiration_date Time.now+10.days
    description "A single use coupon"
    promotion {Promotion.first || FactoryGirl.create(:promotion)}
    allowed_products  [EAAppraisalTypeShortRestricted]
  end
end
