class EpisodeDb < ActiveRecord::Migration[5.2]
  def change
    drop_table :episode_dbs
  end
end
