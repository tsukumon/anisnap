class RenameTitleColumnToNewslists < ActiveRecord::Migration[5.2]
  def change
    rename_column :newslists, :title, :article_title
  end
end
