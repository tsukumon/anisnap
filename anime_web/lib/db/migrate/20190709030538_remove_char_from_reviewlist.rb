class RemoveCharFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :char, :text
  end
end
