class AddAnimeIdToEpisodelist < ActiveRecord::Migration[5.2]
  def change
    add_column :episodelists, :anime_id, :string
  end
end
