class Appraisals::BuildController < ApplicationController
  include Wicked::Wizard

  steps :general, :characteristics, :photos, :plan, :payment, :thank

  def show
    @appraisal = Appraisal.find(params[:appraisal_id])
    @appraisal.photos.build if @appraisal.photos.empty?
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
    @appraisal.update_attributes(params[:appraisal])
    render_wizard @appraisal
  end
end
