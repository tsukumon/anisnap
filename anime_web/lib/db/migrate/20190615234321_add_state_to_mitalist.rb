class AddStateToMitalist < ActiveRecord::Migration[5.2]
  def change
    add_column :mitalists, :state, :integer
  end
end
