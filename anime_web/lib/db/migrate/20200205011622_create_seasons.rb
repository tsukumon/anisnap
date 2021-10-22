class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.text :this_term
      t.text :next_term

      t.timestamps
    end
  end
end
