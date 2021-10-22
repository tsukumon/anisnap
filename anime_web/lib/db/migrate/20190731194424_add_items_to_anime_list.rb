class AddItemsToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :items, :string
  end
end
