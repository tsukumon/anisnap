class CreateRankingTotalDraws < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking_total_draws do |t|
      t.integer :anime_id
      t.integer :rank
      t.string :score_up

      t.timestamps
    end
  end
end
