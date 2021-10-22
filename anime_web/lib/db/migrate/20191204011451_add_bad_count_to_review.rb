class AddBadCountToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :bad_count, :string
  end
end
