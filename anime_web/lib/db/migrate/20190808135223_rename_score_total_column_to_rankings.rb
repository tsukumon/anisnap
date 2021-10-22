class RenameScoreTotalColumnToRankings < ActiveRecord::Migration[5.2]
  def change
    rename_column :rankings, :score_total, :ave_score
  end
end
