json.array! @photos do |photo|
  json.id photo.id
  json.album_name photo.album.name
  json.photo_name photo.name
  json.url photo.image? ? photo.image.url : ''
end