json.files do
  json.array!(@photos) do |photo|
    json.id photo.id
    json.name File.basename(photo.asset.to_s)
    json.url photo.picture_url
    json.thumbnailUrl photo.picture_url(:thumb)
    json.deleteUrl appraisal_photo_url(:id => photo.id, :appraisal_id => @appraisal)
    json.deleteType "DELETE"
    json.tag_url photo_tag_url(@appraisal, photo)
    json.tag_type "POST"
    json.is_default photo.default
    json.set_as_default_url url_for(:controller => :photos, :action => "set_as_default", :appraisal_id => @appraisal, :photo_id => photo.id)
  end
end

