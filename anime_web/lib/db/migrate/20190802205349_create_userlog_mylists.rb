class CreateUserlogMylists < ActiveRecord::Migration[5.2]
  def change
    create_table :userlog_mylists do |t|
      t.integer :user_id
      t.integer :anime_id
      t.text :anime_title
      t.string :state

      t.timestamps
    end
  end
end
