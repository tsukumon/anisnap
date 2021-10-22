class RemoveVoiceFromReviewlist < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviewlists, :voice, :text
  end
end
