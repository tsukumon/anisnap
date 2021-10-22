class AddCvflexToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :cvflex, :text
  end
end
