class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :product_id
      t.integer :disk
      t.string :name

      t.timestamps
    end
  end
end
