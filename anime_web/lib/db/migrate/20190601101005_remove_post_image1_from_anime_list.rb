class RemovePostImage1FromAnimeList < ActiveRecord::Migration[5.2]
  def change
    remove_column :anime_lists, :post_image1, :text
  end
end
