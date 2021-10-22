class AddPasswordToUserlist < ActiveRecord::Migration[5.2]
  def change
    add_column :userlists, :password, :string
  end
end
