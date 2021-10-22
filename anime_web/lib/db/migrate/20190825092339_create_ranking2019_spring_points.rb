class CreateRanking2019SpringPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking2019_spring_points do |t|
      t.integer :anime_id
      t.integer :rank

      t.timestamps
    end
  end
end
