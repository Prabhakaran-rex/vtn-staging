json.array!(@photos) do |json, photo|
  json.id photo.id
  json.name photo.asset_file_name
  json.size photo.asset_file_size
  json.url photo.asset.url(:original)
  json.thumbnail_url photo.asset.url(:thumb)
  json.delete_url appraisal_photo_url(@appraisal, photo)
  json.delete_type "DELETE"
  json.tag_url photo_tag_url(@appraisal, photo)
  json.tag_type "POST"
  json.is_default photo.default
  json.set_as_default_url url_for(:controller => :photos, :action => "set_as_default", :appraisal_id => @appraisal, :photo_id => photo.id)
end