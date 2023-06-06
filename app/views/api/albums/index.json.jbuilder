json.albums do 
  json.array! @albums do |album|
    json.extract! album, :id, :name, :artist_id
  end
end

json.artists do 
  json.array! @albums do |album|
    album.artist
  end
end

json.songs do 
  json.array! @albums do |album|
    album.songs.each do |song|
      json.extract! song, :id, :name, :runtime, :album_id
    end
  end 
end