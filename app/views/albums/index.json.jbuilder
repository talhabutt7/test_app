json.array!(@albums) do |album|
  json.id album.id
  json.name album.name
  json.photos album.photos do |photo|
    json.id photo.id
    json.name photo.name
    json.url photo.image? ? photo.image.url : ''
  end
end
