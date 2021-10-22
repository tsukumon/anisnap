class UserList < ActiveRecord::Migration[5.2]
  def change
    drop_table :userlists
  end
end
