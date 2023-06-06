class UpdateSongs4 < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :runtime, :string
  end
end
