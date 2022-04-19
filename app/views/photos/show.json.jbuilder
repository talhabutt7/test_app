json.id @photo.id
json.album_name @photo.album.name
json.photo_name @photo.name
json.url @photo.image? ? url_for(photo.image): ''