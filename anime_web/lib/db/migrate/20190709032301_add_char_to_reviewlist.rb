class AddCharToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :char, :integer
  end
end
