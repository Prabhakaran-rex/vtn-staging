require 'authorizenet_module'
class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @appraisal = Appraisal.find(params[:appraisal_id])
    payment_response = AuthorizenetModule::PayGateway.new.process(appraisal: @appraisal, appraisal_params: params[:appraisal] )
    respond_to do |format|
      format.json {render :json => payment_response.to_json}
    end
  end

  def validate_coupon
    respond_to do |format|
      coupon = Coupon.details_for(params[:coupon_code])
      if Coupon.is_coupon_valid?(params[:coupon_code]) && coupon.valid_for_appraisal?(params[:appraisal_type].to_i)
        format.json {render json: {discount: coupon.calculate_discounted_amount(PAYMENT_PLAN[(params[:appraisal_type].to_i)-1]), discount_type: coupon.discount_type}}
      else
        format.json { render json: false, status: :unprocessable_entity }
      end
    end
  end
end
