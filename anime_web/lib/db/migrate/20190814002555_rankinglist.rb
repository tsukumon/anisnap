class Rankinglist < ActiveRecord::Migration[5.2]
  def change
    drop_table :rankinglists
  end
end
