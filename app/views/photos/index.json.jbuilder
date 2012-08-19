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
end