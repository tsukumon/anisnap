class AddAnimeIdToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :anime_id, :integer
  end
end
