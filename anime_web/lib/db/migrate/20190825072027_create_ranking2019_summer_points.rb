class CreateRanking2019SummerPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking2019_summer_points do |t|
      t.integer :anime_id
      t.integer :rank

      t.timestamps
    end
  end
end
