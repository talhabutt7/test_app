json.array!(@albums) do |j, album|
  puts album
  j.(album, :id, :name)
  j.photos album.photos do |h, photo|
    h.(photo, :id, :name, :image)
  end
end
