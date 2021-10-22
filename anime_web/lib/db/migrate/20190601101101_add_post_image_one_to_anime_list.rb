class AddPostImageOneToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :post_image_one, :text
  end
end
