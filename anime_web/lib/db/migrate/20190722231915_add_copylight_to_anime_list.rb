class AddCopylightToAnimeList < ActiveRecord::Migration[5.2]
  def change
    add_column :anime_lists, :copylight, :string
  end
end
