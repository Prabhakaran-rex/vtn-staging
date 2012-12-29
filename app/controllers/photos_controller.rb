class PhotosController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
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
        @photos = [@photo]
        if !params[:iframe_redirect_to].nil?
            json_string = render_to_string(template: 'photos/index.json.jbuilder', locals: { photos: @photos})
            redirect_url = params[:iframe_redirect_to].gsub("%s",URI::escape(json_string))
        end
        redirect_url ||= appraisal_photos_path(@appraisal)
        format.html {redirect_to redirect_url, notice: 'Photo was successfully created.'}
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
