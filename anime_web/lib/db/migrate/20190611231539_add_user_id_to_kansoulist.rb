class AddUserIdToKansoulist < ActiveRecord::Migration[5.2]
  def change
    add_column :kansoulists, :user_id, :integer
  end
end
