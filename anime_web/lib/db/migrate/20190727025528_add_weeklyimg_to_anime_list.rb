class AddWeeklyimgToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :weeklyimg, :string
  end
end
