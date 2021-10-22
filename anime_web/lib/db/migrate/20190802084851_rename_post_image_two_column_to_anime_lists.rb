class RenamePostImageTwoColumnToAnimeLists < ActiveRecord::Migration[5.2]
  def change
    rename_column :anime_lists, :post_image_two, :pv1_image
  end
end
