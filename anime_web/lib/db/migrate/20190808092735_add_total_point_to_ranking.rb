class AddTotalPointToRanking < ActiveRecord::Migration[5.2]
  def change
    add_column :rankings, :total_point, :integer
  end
end
