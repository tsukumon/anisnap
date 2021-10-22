class AddVoiceToReviewlist < ActiveRecord::Migration[5.2]
  def change
    add_column :reviewlists, :voice, :text
  end
end
