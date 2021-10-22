class AddAnimetitleToSewayaki < ActiveRecord::Migration[5.2]
  def change
    add_column :sewayakis, :animetitle, :text
  end
end
