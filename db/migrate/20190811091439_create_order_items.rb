class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_number
      t.integer :order_id
      t.integer :price

      t.timestamps
    end
  end
end