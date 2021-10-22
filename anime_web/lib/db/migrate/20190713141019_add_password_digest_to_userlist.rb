class AddPasswordDigestToUserlist < ActiveRecord::Migration[5.2]
  def change
    add_column :userlists, :password_digest, :string
  end
end
