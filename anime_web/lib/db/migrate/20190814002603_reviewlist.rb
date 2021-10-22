class Reviewlist < ActiveRecord::Migration[5.2]
  def change
    drop_table :reviewlists
  end
end
