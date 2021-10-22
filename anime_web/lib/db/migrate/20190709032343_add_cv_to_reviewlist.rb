class AddCvToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :cv, :integer
  end
end
