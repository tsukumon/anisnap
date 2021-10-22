class AddImpressionsCountToNewslist < ActiveRecord::Migration[5.2]
  def change
    add_column :newslists, :impressions_count, :integer, default: 0
  end
end
