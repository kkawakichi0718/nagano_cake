class AddGenreNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_name, :string
  end
end
