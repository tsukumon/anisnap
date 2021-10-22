class RankingMonthlyMusic < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_monthly_musics
  end
end
