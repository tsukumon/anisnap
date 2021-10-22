class AddUserIdToPostlike < ActiveRecord::Migration[5.2]
  def change
    add_column :postlikes, :user_id, :string
  end
end
