class RenamePostImageOneColumnToAnimelists < ActiveRecord::Migration[5.2]
  def change
    rename_column :anime_lists, :post_image_one, :pv1
  end
end
