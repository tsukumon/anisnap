class CreateJoblists < ActiveRecord::Migration[5.2]
  def change
    create_table :joblists do |t|
      t.text :job
      t.integer :userid

      t.timestamps
    end
  end
end
