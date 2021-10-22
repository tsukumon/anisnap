class AddImpressionsCountToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :impressions_count, :integer, default: 0
  end
end
