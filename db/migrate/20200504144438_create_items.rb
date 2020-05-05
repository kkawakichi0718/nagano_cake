class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_id
      t.boolean :is_sold, default: false, null: false

      t.timestamps
    end
  end
end
