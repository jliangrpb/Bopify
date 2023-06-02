class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false, index: true
      t.references :artist, index: true, foreign_key: true 
      t.string :img_url
      t.timestamps
    end
  end
end
