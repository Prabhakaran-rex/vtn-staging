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

  context "expiration date" do
    it "should require a date" do
      dateless_coupon = FactoryGirl.build(:coupon, :expiration_date => "")
      dateless_coupon.should_not be_valid
    end

    it "should be in the future" do
      expired_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now-1.day)
      expired_coupon.should_not be_valid
    end

    it "should return it's expired status" do
      expired_coupon = FactoryGirl.build(:coupon, :expiration_date => Time.now-1.day)
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
      used_coupon.apply!
      used_coupon.used_on.should_not be nil
    end
  end

  context "code validity" do
    it "should check if the coupon exists and is active"
    it "should return coupon details"
  end

  context "multiple use coupons" do
    it "should have a max number of uses"
    it "increments the usage count"
  end

  context "using coupon" do
    it "should return the discounted amount for fixed coupons" do
      coupon = FactoryGirl.create(:fixed_coupon, discount: 5)
      coupon.calculate_discount(15.00).should eq 10.00
    end

    it "should return the discounted amount for percentage coupons" do
      coupon = FactoryGirl.create(:percentage_coupon, discount: 20)
      coupon.calculate_discount(15.00).should eq 12.00
    end
  end
end

