class RankingMonthlyMylist < ActiveRecord::Migration[5.2]
  def change
    drop_table :ranking_monthly_mylists
  end
end
