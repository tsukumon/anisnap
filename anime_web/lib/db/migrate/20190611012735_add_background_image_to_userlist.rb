class AddBackgroundImageToUserlist < ActiveRecord::Migration[5.2]
  def change
    add_column :userlists, :background_image, :string
  end
end
