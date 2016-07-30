require 'spec_helper'

describe Coupon do

  before(:each) do
  end

  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:coupon)
  end

  context "code" do
    it "should be 16 chars long" do
      short_code = FactoryGirl.build(:coupon, :code => "aaa")
      short_code.should_not be_valid
    end

    #it "should be unique" do
    #FactoryGirl.create(:coupon, :code => "wyxz9876wyxz9876")
    #duplicate_coupon = FactoryGirl.build(:coupon, :code => "wyxz9876wyxz9876")
    #duplicate_coupon.should_not be_valid
    #end

    it "creates a new code on save" do
      codeless_coupon = FactoryGirl.create(:coupon, :code => nil)
      codeless_coupon.code.length.should be 16
    end
  end

  context "discount" do
    it "should have an amount" do
      discountless_coupon = FactoryGirl.build(:coupon, :discount => nil)
      discountless_coupon.should_not be_valid
    end

    it "should have a positive amount" do
      negative_coupon = FactoryGirl.build(:coupon, :discount => -10)
      negative_coupon.should_not be_valid
    end
  end

  context "discount type" do
    it "should have a type" do
      typeless_coupon = FactoryGirl.build(:coupon, :discount_type => nil)
      typeless_coupon.should_not be_valid
    end

    it "should be either a 'fixed' or 'percentage' coupon" do
      invalid_type_coupon = FactoryGirl.build(:coupon, :discount_type => "invalid_type")
    end

    context "percentage" do
      it "should not be greater than 100" do
        too_big_coupon = FactoryGirl.build(:coupon, :discount => 101, :discount_type => "percentage")
        too_big_coupon.should_not be_valid
      end
    end

    context "fixed" do
      it "should not be greater than the most expensive appraisal" do
        too_big_coupon = FactoryGirl.build(:fixed_coupon, :discount => 101)
        too_big_coupon.should_not be_valid
      end
    end
  end

  context "coupon status" do
    it "should be marked as active by default" do
      new_coupon = FactoryGirl.create(:coupon)
      new_coupon.is_active?.should be true
    end

    it "can be deactivated" do
      active_coupon = FactoryGirl.create(:coupon)
      active_coupon.deactivate!
      active_coupon.is_active?.should be false
    end

    it "can be activated" do
      inactive_coupon = FactoryGirl.create(:coupon, active: false)
      inactive_coupon.activate!
      inactive_coupon.is_active?.should be true
    end
  end

  context "start date" do
    it "should require a date" do
      dateless_coupon = FactoryGirl.build(:coupon, :start_date => "")
      dateless_coupon.should_not be_valid
    end

    it "should not be valid before start date" do
      expired_coupon = FactoryGirl.build(:coupon, :start_date => Time.now+2.day)
      Coupon.is_coupon_valid?(expired_coupon.code).should be false && start_date <= Time.now
    end
  end

  context "expiration date" do
    it "should require a date" do
      dateless_coupon = FactoryGirl.build(:coupon, :expiration_date => "")
      dateless_coupon.should_not be_valid
    end

    it "should be in the future" do
      expired_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now-2.day)
      expired_coupon.should_not be_valid
    end

    it "should be greater than the start date" do
      time_travelling_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now+2.day, :start_date => Time.now+4.day)
      time_travelling_coupon.should_not be_valid
    end

    it "should return it's expired status" do
      expired_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now-2.day)
      expired_coupon.is_expired?.should be true
    end
  end

  context "used on" do
    it "should not have a usage_date by default" do
      unused_coupon = FactoryGirl.create(:coupon)
      unused_coupon.used_on.should be nil
    end

    it "should be greater than the expiration date" do
      expired_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now+1.day, :used_on => Time.now+2.days)
      expired_coupon.should_not be_valid
    end

    it "should set the usage date when applied" do
      used_coupon = FactoryGirl.build(:unused_coupon)
      used_coupon.apply!(FactoryGirl.create(:appraisal))
      used_coupon.used_on.should_not be nil
    end
  end

  context "code validity" do
    it "should check if the coupon exists" do
      Coupon.is_coupon_valid?("anonexistingcoup").should be false
    end

    it "should return coupon details" do
      coupon = FactoryGirl.create(:coupon, code: "1234code1234code")
      Coupon.details_for("1234code1234code").should be_a_kind_of(Coupon)
    end

    it "should check if the coupon is active" do
      coupon = FactoryGirl.create(:coupon, active: false )
      Coupon.is_coupon_valid?(coupon.code).should be false
    end
  end

  context "multiple use coupons" do
    it "should have a max number of uses" do
      multiple_use_coupon = FactoryGirl.create(:coupon)
      multiple_use_coupon.max_usage.should be > 0
    end

    it "increments the usage count" do
      multiple_use_coupon = FactoryGirl.create(:coupon)
      multiple_use_coupon.apply!(FactoryGirl.create(:appraisal))
      multiple_use_coupon.usage_count.should eq 1
    end

    it "can not be used more than the allowed times" do
      multiple_use_coupon = FactoryGirl.create(:coupon, max_usage: 2, usage_count: 2)
      multiple_use_coupon.apply!(FactoryGirl.create(:appraisal)).should be false
    end

  end

  context "using coupon" do
    it "should return the discounted amount for fixed coupons" do
      coupon = FactoryGirl.create(:fixed_coupon, discount: 5)
      coupon.calculate_discounted_amount(15.00).should eq 10.00
    end

    it "should return the discounted amount for percentage coupons" do
      coupon = FactoryGirl.create(:percentage_coupon, discount: 20)
      coupon.calculate_discounted_amount(15.00).should eq 12.00
    end

    it "can have a maximum discount amount" do
      maximum_discount_coupon = FactoryGirl.create(:percentage_coupon, max_discount: 2, discount: 20)
      maximum_discount_coupon.calculate_discounted_amount(15.00).should eq 13.00
    end
  end

  context "featured coupon" do
    it "can only have one featured coupon" do
      featured_coupon = FactoryGirl.create(:coupon, featured: true)
      duplicate_featured_coupon = FactoryGirl.build(:coupon, featured: true, code: "88765qwer765qwer")
      duplicate_featured_coupon.should_not be_valid
    end
  end

  context "allowed products" do
    it "has a list of allowed products" do
      single_product_coupon = FactoryGirl.create(:single_product_coupon, allowed_products: [EAAppraisalTypeShortRestricted])
      single_product_coupon.should be_valid
    end

    it "only existing products can be added to the list of allowed products" do
      imaginary_product_coupon = FactoryGirl.build(:single_product_coupon, allowed_products: [9999])
      imaginary_product_coupon.should_not be_valid
    end

    it "should sanitize list of allowed products" do
      empty_string_product = FactoryGirl.create(:coupon, allowed_products: ["", EAAppraisalTypeShortRestricted, EAAppraisalTypeLongForSelling])
      empty_string_product.allowed_products.should =~ [EAAppraisalTypeShortRestricted, EAAppraisalTypeLongForSelling]
    end

    it "only allowed products can use the coupon" do
      non_participating_coupon = FactoryGirl.create(:single_product_coupon, allowed_products: [EAAppraisalTypeShortRestricted, EAAppraisalTypeShortForSelling])
      non_participating_coupon.valid_for_appraisal?(EAAppraisalTypeLongForSelling).should be false
      non_participating_coupon.valid_for_appraisal?(EAAppraisalTypeShortRestricted).should be true
    end

    it "if not set, then all products are allowed" do
      universal_coupon = FactoryGirl.create(:coupon, allowed_products: nil)
      universal_coupon.valid_for_appraisal?(EAAppraisalTypeShortRestricted).should be true
    end
  end

  #Can we add a field that tells us how many dollars each coupon campaign has brought in?  This number needs to be expressed in total
  #gross margin which of course is the difference between what we collect from consumers and what we pay appraisers. This information is
  #needed so we can easly pay anyone a percentage of the gross margin should they run a coupon campaign for us
  context "gross profit" do
    it "should link a coupon to the appraisal that used it" do
      appraisal = FactoryGirl.create(:appraisal, selected_plan: EAAppraisalTypeShortRestricted)
      coupon = FactoryGirl.create(:coupon)
      coupon.apply!(appraisal)
      coupon.usage_count.should eq 1
    end

    it "should calculate gross profit for a completed appraisal" do
      appraisal = FactoryGirl.create(:appraisal, selected_plan: EAAppraisalTypeShortRestricted, status: EActivityValueFinalized)
      appraisal_cost = PAYMENT_PLAN[appraisal.selected_plan - 1]
      appraiser = FactoryGirl.create(:appraiser)
      coupon = FactoryGirl.create(:fixed_coupon, discount: 5 )
      payment = FactoryGirl.create(:payment, amount: appraisal_cost - coupon.discount)
      coupon.apply!(appraisal)
      payout = FactoryGirl.create(:payout, appraiser: appraiser, appraisal: appraisal, status: EAPayoutPending, amount: 10.00)
      coupon.gross_profit.should eq ((appraisal_cost - coupon.discount - payout.amount).round(2))
    end
  end
end


