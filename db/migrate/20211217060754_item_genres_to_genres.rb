class ItemGenresToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :item_genres, :genres
  end
end
