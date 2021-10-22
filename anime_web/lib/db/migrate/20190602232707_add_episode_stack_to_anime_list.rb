class AddEpisodeStackToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :episode_stack, :text
  end
end
