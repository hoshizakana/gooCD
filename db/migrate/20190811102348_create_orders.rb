class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :shipping_status, default: "発送準備中"
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :postal_code
      t.string :address
      t.string :phone
      t.integer :total_price

      t.timestamps
    end
  end
end
