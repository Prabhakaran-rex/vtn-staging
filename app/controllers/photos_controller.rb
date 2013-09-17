class PhotosController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_filter :load_appraisal

  def index
    @photos = @appraisal.photos.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @photo = @appraisal.photos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def new
    @photo = @appraisal.photos.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
    @photo = @appraisal.photos.find(params[:id])
  end

  def create
    cloudinary_asset = "image/upload/v#{params[:version]}/#{params[:public_id]}.#{params[:format]}##{params[:signature]}"
    @photo = @appraisal.photos.find_or_initialize_by_name(picture: cloudinary_asset, name: params[:public_id])
    if @photo.save
      @photos = [@photo]
      render 'index'
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

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

  def destroy
    @photo = @appraisal.photos.find(params[:id])
    @photo.destroy
    render :json => true
  end

  def tag
    @appraisal = Appraisal.find(params[:appraisal_id])
    @photo = Photo.find(params[:photo_id])
  end

  def set_as_default
    begin
      appraisal = Appraisal.find(params[:appraisal_id])
      @photo = appraisal.photos.find(params[:photo_id])
      @photo.set_as_default!(appraisal.photos)
    rescue
      @photo = nil
    ensure
      respond_to do |format|
        if @photo
          format.json { head :no_content}
        else
          format.json { render json: {:error => "error"}, status: :unprocessable_entity }
        end
      end
    end
  end

  private 
  def load_appraisal
    @appraisal = Appraisal.find(params[:appraisal_id])
  end
end
