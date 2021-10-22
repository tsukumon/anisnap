class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :anime_id
      t.integer :mylist_count
      t.integer :review_count
      t.integer :score_total
      t.integer :score_stroy
      t.integer :score_write
      t.integer :score_music
      t.integer :score_voice
      t.integer :score_char

      t.timestamps
    end
  end
end
