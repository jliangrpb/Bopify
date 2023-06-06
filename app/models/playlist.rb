class Playlist < ApplicationRecord 
    validates :name, :user_id, presence: true 

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User,
        dependent: :destroy 

    has_many :playlist_songs,
        primary_key: :id, 
        foreign_key: :playlist_id,
        class_name: :PlaylistSong,
        dependent: :destroy 

    has_many :songs,
        through: :playist_songs,
        source: :song 

    has_many :albums,
        through: :songs,
        source: :album

    has_many :artists,
        through: :albums,
        source: :artist
end