class AddCounterToEpisodelist < ActiveRecord::Migration[5.2]
  def change
    add_column :episodelists, :counter, :integer
  end
end
