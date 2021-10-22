class CreateRankingWeeklies < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking_weeklies do |t|
      t.integer :anime_id
      t.integer :rank_total

      t.timestamps
    end
  end
end
