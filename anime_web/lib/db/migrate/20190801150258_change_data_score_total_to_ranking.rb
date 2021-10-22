class ChangeDataScoreTotalToRanking < ActiveRecord::Migration[5.2]
  def change
    change_column :rankings, :score_stroy, :decimal, {:precision=>2, :scale=>1}
    change_column :rankings, :score_write, :decimal, {:precision=>2, :scale=>1}
    change_column :rankings, :score_music, :decimal, {:precision=>2, :scale=>1}
    change_column :rankings, :score_voice, :decimal, {:precision=>2, :scale=>1}
    change_column :rankings, :score_char, :decimal, {:precision=>2, :scale=>1}
  end
end
