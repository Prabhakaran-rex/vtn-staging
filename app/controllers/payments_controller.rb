require 'authorizenet_module'
class PaymentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @appraisal = Appraisal.find(params[:appraisal_id])
    if params[:vtn_partner] == "true"
      user = @appraisal.owned_by
      payment_response = Payment.export_to_freshbook(params[:partner_attributes],@appraisal, params[:processXW], params[:appraisal][:payment_attributes][:coupon])
      Payment.create_partner_informations_for_appraisal(@appraisal.id, params[:partner_attributes])
    else
      payment_response = AuthorizenetModule::PayGateway.new.process(appraisal: @appraisal, appraisal_params: params[:appraisal], email: current_user.email )      
    end

    respond_to do |format|
      format.json {render :json => payment_response.to_json}
    end
  end

  def validate_coupon
    respond_to do |format|
      coupon = Coupon.details_for(params[:coupon_code])
      user = User.find(params[:customer_id])
      if Coupon.is_coupon_valid?(params[:coupon_code]) && coupon.valid_for_appraisal?(params[:appraisal_type].to_i)
        unless user.is_partner && !PartnerPricing.find_by_user_id(user).blank?
          amount = PAYMENT_PLAN[(params[:appraisal_type].to_i)-1] 
        else
          amount = get_pricing_of_partner(current_user, params[:appraisal_type].to_i, params[:is_xw])
        end

        format.json {render json: {discount: coupon.calculate_discounted_amount(amount), discount_type: coupon.discount_type}}
      else
        format.json { render json: false, status: :unprocessable_entity }
      end
    end
  end

  private
    def get_pricing_of_partner(user, selected_plan, is_xw)
      pricing = PartnerPricing.find_by_user_id(user)
      if pricing.blank?
        return PAYMENT_PLAN[selected_plan-1]
      end
      
      price = 0
      if selected_plan > 4
        selected_plan -= 4
        price += 20
      end

      plan = PAYMENT_PLAN_FOR_PARTNER[selected_plan]
      if is_xw == "false"
        case plan
          when "short_restricted"
            price += pricing.short_restricted
          when "full_restricted"
            price += pricing.full_restricted
          when "full_use"
            price += pricing.full_use      
        end
      else
        case plan
          when "short_restricted"
            price += pricing.short_restricted_xw
          when "full_restricted"
            price += pricing.full_restricted_xw
          when "full_use"
            price += pricing.full_use_xw
        end
      end

      return price
    end

end
