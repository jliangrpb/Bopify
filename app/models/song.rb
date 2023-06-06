class Song < ApplicationRecord 
    validates :name, :album_id, presence: true

    belongs_to :album,
        primary_key: :id, 
        foreign_key: :album_id,
        class_name: :Album,
        dependent: :destroy

    has_one :artist,
        through: :album,
        source: :artist

    has_many :playlist_songs,
        primary_key: :id,
        foreign_key: :song_id,
        class_name: :PlaylistSong,
        dependent: :destroy

end