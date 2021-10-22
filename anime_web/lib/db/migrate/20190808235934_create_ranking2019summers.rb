class CreateRanking2019summers < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking2019summers do |t|
      t.string :anime_id
      t.string :integer
      t.integer :rank

      t.timestamps
    end
  end
end
