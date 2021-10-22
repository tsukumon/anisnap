class RemovePasswordFromUserlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :userlists, :password, :string
  end
end
