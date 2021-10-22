class AddImageNameToUserlists < ActiveRecord::Migration[5.2]
  def change
    add_column :userlists, :image_name, :string
  end
end
