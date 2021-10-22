class AddBgimageToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :bgimage, :string
  end
end
