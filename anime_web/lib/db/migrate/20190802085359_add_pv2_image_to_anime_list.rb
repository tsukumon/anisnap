class AddPv2ImageToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :pv2_image, :text
  end
end
