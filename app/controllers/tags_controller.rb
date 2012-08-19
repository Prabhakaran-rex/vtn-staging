class TagsController < ApplicationController
  # POST /tags.json
  def create
    photo = Photo.find(params["photo_id"])
    theTag = photo.tags.new
    theTag.width = params["width"]
    theTag.height = params["height"]
    theTag.top = params["top"]
    theTag.left = params["left"]
    theTag.label = params["label"]
    theTag.user_id = current_user
    @tag = theTag

    respond_to do |format|
      if @tag.save
        format.json { render json: @tag, status: :created, location: @photo }
      else
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
