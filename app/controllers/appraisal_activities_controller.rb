class AppraisalActivitiesController < ApplicationController
  # GET /appraisal_activities
  # GET /appraisal_activities.json
  def index
    @appraisal_activities = AppraisalActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appraisal_activities }
    end
  end

  # GET /appraisal_activities/1
  # GET /appraisal_activities/1.json
  def show
    @appraisal_activity = AppraisalActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appraisal_activity }
    end
  end

  # GET /appraisal_activities/new
  # GET /appraisal_activities/new.json
  def new
    @appraisal_activity = AppraisalActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appraisal_activity }
    end
  end

  # GET /appraisal_activities/1/edit
  def edit
    @appraisal_activity = AppraisalActivity.find(params[:id])
  end

  # POST /appraisal_activities
  # POST /appraisal_activities.json
  def create
    @appraisal_activity = AppraisalActivity.new(params[:appraisal_activity])

    respond_to do |format|
      if @appraisal_activity.save
        format.html { redirect_to @appraisal_activity, notice: 'Appraisal activity was successfully created.' }
        format.json { render json: @appraisal_activity, status: :created, location: @appraisal_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @appraisal_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appraisal_activities/1
  # PUT /appraisal_activities/1.json
  def update
    @appraisal_activity = AppraisalActivity.find(params[:id])

    respond_to do |format|
      if @appraisal_activity.update_attributes(params[:appraisal_activity])
        format.html { redirect_to @appraisal_activity, notice: 'Appraisal activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appraisal_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisal_activities/1
  # DELETE /appraisal_activities/1.json
  def destroy
    @appraisal_activity = AppraisalActivity.find(params[:id])
    @appraisal_activity.destroy

    respond_to do |format|
      format.html { redirect_to appraisal_activities_url }
      format.json { head :no_content }
    end
  end
end
