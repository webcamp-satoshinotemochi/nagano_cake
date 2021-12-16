class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      
      t.integer :genres_id,null: false
      t.string :image_id
      t.string :name,null: false, default: ""
      t.text :body,null: false, default: ""
      t.integer :price_before_tax,null: false, default: ""
      t.boolean :is_active,null: false, default: true
      
      t.timestamps
    end
  end
end
