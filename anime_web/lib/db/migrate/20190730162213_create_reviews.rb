class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :animetitle
      t.integer :user_id
      t.text :kansou
      t.string :state
      t.decimal :total, precision: 3, scale: 1
      t.decimal :story, precision: 2, scale: 1
      t.decimal :draw, precision: 2, scale: 1
      t.decimal :music, precision: 2, scale: 1
      t.decimal :voice, precision: 2, scale: 1
      t.decimal :chara, precision: 2, scale: 1


      t.timestamps
    end
  end
end
