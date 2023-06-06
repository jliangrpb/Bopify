# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  artist_id  :bigint
#  img_url    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :name, :artist_id, presence: true

    has_one_attached :photo
    
    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artist

    has_many :songs,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: :Song 
end
