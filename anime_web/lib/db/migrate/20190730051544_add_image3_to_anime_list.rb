class AddImage3ToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :image3, :string
  end
end
