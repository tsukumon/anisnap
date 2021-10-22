class AddUnconfirmedEmailToDevise < ActiveRecord::Migration[5.2]
  def up
     add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
  end
end
