class ChangeDataTotalScoreToRanking < ActiveRecord::Migration[5.2]
  def change
    change_column :rankings, :score_total, :decimal,{:precision=>2, :scale=>1}
  end
end
