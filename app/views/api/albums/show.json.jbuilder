json.album do
    json.set! :songs do
        @songs.each do |song|
            json.set! song.id do
                json.extract! song, :name
                json.extract! song.album.artist, :name
            end
        end
    end
    # json.set! :artist do
    #     json.extract! @album.artist, :name
    # end
    json.artist @album.artist.name 
    json.extract! @album, :id, :artist_id, :name
end
