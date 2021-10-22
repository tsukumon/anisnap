class AddIntroToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intro, :text
  end
end
