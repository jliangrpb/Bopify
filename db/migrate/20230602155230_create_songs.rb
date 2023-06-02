class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.references :album, null: false, foreign_key: {to_table: :albums}
      t.references :artist, null: false, foreign_key: {to_table: :artists}
      t.string :song_url, null: false 
      t.timestamps
    end
  end
end
