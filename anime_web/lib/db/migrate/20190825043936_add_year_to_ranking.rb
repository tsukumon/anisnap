class AddYearToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :year, :string
  end
end
