class AddImage2ToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :image2, :string
  end
end
