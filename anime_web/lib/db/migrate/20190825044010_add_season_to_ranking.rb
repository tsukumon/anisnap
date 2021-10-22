class AddSeasonToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :season, :string
  end
end
