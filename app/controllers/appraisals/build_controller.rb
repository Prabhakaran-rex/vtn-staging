class Appraisals::BuildController < ApplicationController
  include Wicked::Wizard

  steps :general, :characteristics, :photos, :plan, :payment, :thank

  def show
    @appraisal = Appraisal.find(params[:appraisal_id])
    @photos = @appraisal.photos
    @appraisal.payment = Payment.new(user_id: current_user.id, appraisal_id: @appraisal.id) if @appraisal.payment.nil?
    render_wizard
  end

  def create
    @appraisal = Appraisal.create(created_by: current_user.id, status: EActivityValueCreated)
    redirect_to wizard_path(steps.first, :appraisal_id => @appraisal.id)
  end

  def update
    @appraisal = Appraisal.find(params[:appraisal_id])
    params[:appraisal][:appraisal_info] = @appraisal.merge_appraisal_info(params)
    params[:appraisal].except!(:payment_attributes)
    params[:appraisal][:step] = step
    params[:appraisal][:step] = 'active' if step == steps.last
    params[:appraisal][:selected_plan] = (params[:appraisal][:selected_plan].to_i + 4) if params[:isPair]
    @appraisal.update_attributes(params[:appraisal])
    @appraisal.assigned_to = Appraiser.find(@appraisal.appraiser_referral.to_i) unless @appraisal.appraiser_referral.eql?("") 
    @appraisal.save
    render_wizard @appraisal
  end
end
