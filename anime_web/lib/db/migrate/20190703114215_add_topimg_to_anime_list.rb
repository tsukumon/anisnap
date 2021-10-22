class AddTopimgToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :topimg, :text
  end
end
