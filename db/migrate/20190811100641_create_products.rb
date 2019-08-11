class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :artist_id
      t.integer :label_id
      t.integer :genre_id
      t.string :status, default: "販売中"
      t.string :image_id
      t.integer :price
      t.integer :stock
      t.date :release_date
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
