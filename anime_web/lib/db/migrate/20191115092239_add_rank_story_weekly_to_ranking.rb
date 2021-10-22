class AddRankStoryWeeklyToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :rank_story_weekly, :integer
  end
end
