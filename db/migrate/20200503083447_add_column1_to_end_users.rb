class AddColumn1ToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_unsubscribed, :boolean, default: false, null: false
  end
end
