class CreateItemGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :item_genres do |t|
      
      t.string :name,null: false, default: ""

      t.timestamps
    end
  end
end
