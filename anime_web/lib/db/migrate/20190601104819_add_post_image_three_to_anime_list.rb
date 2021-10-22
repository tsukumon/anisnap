class AddPostImageThreeToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :post_image_three, :text
  end
end
