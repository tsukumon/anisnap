class ChangeDataUserIdToPostlikes < ActiveRecord::Migration[5.2]
  def change
    change_column  :postlikes,:user_id, :integer
  end
end
