class CreateEpisodelists < ActiveRecord::Migration[5.2]
  def change
    create_table :episodelists do |t|
      t.text :title
      t.text :count
      t.text :animetitle

      t.timestamps
    end
  end
end
