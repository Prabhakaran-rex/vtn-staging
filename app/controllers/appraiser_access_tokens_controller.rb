class AppraiserAccessTokensController < ApplicationController
  # GET /appraiser_access_tokens
  # GET /appraiser_access_tokens.json
  def index
    @appraiser_access_tokens = AppraiserAccessToken.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appraiser_access_tokens }
    end
  end

  # GET /appraiser_access_tokens/1
  # GET /appraiser_access_tokens/1.json
  def show
    @appraiser_access_token = AppraiserAccessToken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appraiser_access_token }
    end
  end

  # GET /appraiser_access_tokens/new
  # GET /appraiser_access_tokens/new.json
  def new
    @appraiser_access_token = AppraiserAccessToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appraiser_access_token }
    end
  end

  # GET /appraiser_access_tokens/1/edit
  def edit
    @appraiser_access_token = AppraiserAccessToken.find(params[:id])
  end

  # POST /appraiser_access_tokens
  # POST /appraiser_access_tokens.json
  def create
    @appraiser_access_token = AppraiserAccessToken.new(params[:appraiser_access_token])

    respond_to do |format|
      if @appraiser_access_token.save
        format.html { redirect_to @appraiser_access_token, notice: 'Appraiser access token was successfully created.' }
        format.json { render json: @appraiser_access_token, status: :created, location: @appraiser_access_token }
      else
        format.html { render action: "new" }
        format.json { render json: @appraiser_access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appraiser_access_tokens/1
  # PUT /appraiser_access_tokens/1.json
  def update
    @appraiser_access_token = AppraiserAccessToken.find(params[:id])

    respond_to do |format|
      if @appraiser_access_token.update_attributes(params[:appraiser_access_token])
        format.html { redirect_to @appraiser_access_token, notice: 'Appraiser access token was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appraiser_access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraiser_access_tokens/1
  # DELETE /appraiser_access_tokens/1.json
  def destroy
    @appraiser_access_token = AppraiserAccessToken.find(params[:id])
    @appraiser_access_token.destroy

    respond_to do |format|
      format.html { redirect_to appraiser_access_tokens_url }
      format.json { head :no_content }
    end
  end
end
