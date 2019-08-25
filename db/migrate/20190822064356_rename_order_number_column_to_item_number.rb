class RenameOrderNumberColumnToItemNumber < ActiveRecord::Migration[5.2]
  def change
		rename_column :order_items, :order_number, :item_number
  end
end
