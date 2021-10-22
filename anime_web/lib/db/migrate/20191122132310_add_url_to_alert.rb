class AddUrlToAlert < ActiveRecord::Migration[5.2]
  def change
    add_column :alerts, :url, :text
  end
end
