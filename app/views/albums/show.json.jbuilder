json.id @album.id
json.name @album.name
json.photos @album.photos do |photo|
  json.name photo.name
  json.url photo.image? ? photo.image.url : ''
end