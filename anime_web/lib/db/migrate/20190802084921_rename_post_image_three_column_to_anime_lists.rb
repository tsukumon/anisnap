class RenamePostImageThreeColumnToAnimeLists < ActiveRecord::Migration[5.2]
  def change
    rename_column :anime_lists, :post_image_three, :pv2
  end
end
