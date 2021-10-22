class Wallpaper < ActiveRecord::Migration[5.2]
  def change
    drop_table :wallpapers
  end
end
