class AddSubjectToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :subject, :text
  end
end
