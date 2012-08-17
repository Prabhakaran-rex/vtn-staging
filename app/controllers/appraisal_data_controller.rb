class AppraisalDataController < ApplicationController
  # GET /appraisal_data
  # GET /appraisal_data.json
  def index
    @appraisal_data = AppraisalDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appraisal_data }
    end
  end

  # GET /appraisal_data/1
  # GET /appraisal_data/1.json
  def show
    @appraisal_datum = AppraisalDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appraisal_datum }
    end
  end

  # GET /appraisal_data/new
  # GET /appraisal_data/new.json
  def new
    @appraisal_datum = AppraisalDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appraisal_datum }
    end
  end

  # GET /appraisal_data/1/edit
  def edit
    @appraisal_datum = AppraisalDatum.find(params[:id])
  end

  # POST /appraisal_data
  # POST /appraisal_data.json
  def create
    @appraisal_datum = AppraisalDatum.new(params[:appraisal_datum])

    respond_to do |format|
      if @appraisal_datum.save
        format.html { redirect_to @appraisal_datum, notice: 'Appraisal datum was successfully created.' }
        format.json { render json: @appraisal_datum, status: :created, location: @appraisal_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @appraisal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appraisal_data/1
  # PUT /appraisal_data/1.json
  def update
    @appraisal_datum = AppraisalDatum.find(params[:id])

    respond_to do |format|
      if @appraisal_datum.update_attributes(params[:appraisal_datum])
        format.html { redirect_to @appraisal_datum, notice: 'Appraisal datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appraisal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisal_data/1
  # DELETE /appraisal_data/1.json
  def destroy
    @appraisal_datum = AppraisalDatum.find(params[:id])
    @appraisal_datum.destroy

    respond_to do |format|
      format.html { redirect_to appraisal_data_url }
      format.json { head :no_content }
    end
  end
end
