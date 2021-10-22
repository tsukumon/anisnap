class CreatePostlikes < ActiveRecord::Migration[5.2]
  def change
    create_table :postlikes do |t|
      t.string :like
      t.string :review_id

      t.timestamps
    end
  end
end
