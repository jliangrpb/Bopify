class Song < ApplicationRecord 
    validates :name, :album_id, presence: true

    has_one_attached :photo
    has_one_attached :mp3 

    belongs_to :album,
        primary_key: :id, 
        foreign_key: :album_id,
        class_name: :Album,
        dependent: :destroy

    has_one :artist,
        through: :album,
        source: :artist,
        dependent: :destroy

    has_many :playlist_songs,
        primary_key: :id,
        foreign_key: :song_id,
        class_name: :PlaylistSong,
        dependent: :destroy

end