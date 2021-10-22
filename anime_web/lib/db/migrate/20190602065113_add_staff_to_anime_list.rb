class AddStaffToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :staff, :text
  end
end
