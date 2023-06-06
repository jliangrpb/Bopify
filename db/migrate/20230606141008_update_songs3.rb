class UpdateSongs3 < ActiveRecord::Migration[7.0]
  def change
    remove_column :songs, :song_url
  end
end
