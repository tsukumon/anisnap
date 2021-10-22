class AddJobToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job, :text
  end
end
