class AddImage1ToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :image1, :string
  end
end
