class AddYearToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :year, :integer
  end
end
