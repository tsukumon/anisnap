class ChangeDataScoreCharToRanking < ActiveRecord::Migration[5.2]
  def change
    change_column :rankings, :score_char, :decimal, {:precision=>2, :scale=>1}
  end
end
