class AddBgimageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bgimage, :string
  end
end
