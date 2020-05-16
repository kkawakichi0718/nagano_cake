class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :payments_method, default: 0
      t.integer :total_price
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :addressee
      t.integer :status, default: 0
      t.integer :postage, default: 800
      t.integer :address_option, default: 0

      t.timestamps
    end
  end
end
