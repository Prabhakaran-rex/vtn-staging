class PhotosController < ApplicationController
  before_filter :load_appraisal
  # GET /photos
  # GET /photos.json
  def index
    @photos = @appraisal.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = @appraisal.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = @appraisal.photos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = @appraisal.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = @appraisal.photos.new(params[:photo])

    if @photo.save
      respond_to do |format|
        format.html {redirect_to appraisal_photos_path(@appraisal), notice: 'Photo was successfully created.'}
        @photos = [@photo]
        format.json {render 'index'}
      end
    else
      render 'new'
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = @appraisal.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to @appraisal, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = @appraisal.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to @appraisal }
      format.json { head :no_content }
    end
  end

  def tag
    @photo = Photo.find(params[:photo_id])
  end

  private 
  def load_appraisal
    @appraisal = Appraisal.find(params[:appraisal_id])
  end
end
