class UpdateSongs2 < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :song_url, :string, null: false 
    remove_column :songs, :artist_id
    
  end
end
