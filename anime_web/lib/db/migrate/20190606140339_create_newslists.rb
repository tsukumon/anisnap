class CreateNewslists < ActiveRecord::Migration[5.2]
  def change
    create_table :newslists do |t|
      t.text :title
      t.text :content
      t.text :relation
      t.text :samune_img
      t.text :content_img

      t.timestamps
    end
  end
end
