class AddColumnToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :last_name, :string, null: false, default: ""
    add_column :end_users, :first_name, :string, null: false, default: ""
    add_column :end_users, :last_name_kana, :string, null: false, default: ""
    add_column :end_users, :first_name_kana, :string, null: false, default: ""
    add_column :end_users, :phone_number, :string
    add_column :end_users, :postal_code, :string
    add_column :end_users, :residence_address, :string
  end
end
