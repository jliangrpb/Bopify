json.album do
    json.set! :songs do
        @songs.each_with_index do |song|
            json.set! song.id do
                json.extract! song, :id, :name, :runtime
                json.set! :artist_name, @album.artist.name
                json.photo song.photo.attached? ?  url_for(song.photo.url) : nil
                # debugger
                json.mp3 song.mp3.attached? ?  url_for(song.mp3.url) : nil
                # debugger
            end
        end
    end
    json.artist @album.artist.name 
    json.extract! @album, :id, :artist_id, :name
    json.photo @album.photo.attached? ? url_for(@album.photo) : nil
end
