class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :adress, :string
    add_column :users, :phone, :string
    add_column :users, :is_deleted, :boolean, default: false
  end
end
