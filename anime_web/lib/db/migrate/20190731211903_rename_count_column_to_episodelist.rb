class RenameCountColumnToEpisodelist < ActiveRecord::Migration[5.2]
  def change
    rename_column :episodelists, :count, :str_count
  end
end
