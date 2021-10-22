class AddBassuiToNewslist < ActiveRecord::Migration[5.2]
  def change
    add_column :newslists, :bassui, :text
  end
end
