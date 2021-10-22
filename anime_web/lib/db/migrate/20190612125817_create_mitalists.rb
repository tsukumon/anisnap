class CreateMitalists < ActiveRecord::Migration[5.2]
  def change
    create_table :mitalists do |t|
      t.integer :user_id
      t.integer :anime_id

      t.timestamps
    end
  end
end
