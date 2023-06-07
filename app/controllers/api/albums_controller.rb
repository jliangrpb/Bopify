class Api::AlbumsController < ApplicationController
    def index 
        @albums = Album.all 
        render 'api/albums/index'
    end

    def show 
        @album = Album.find_by(id: params[:id])
        @song = @album.songs
        render 'api/albums/show'
    end
end