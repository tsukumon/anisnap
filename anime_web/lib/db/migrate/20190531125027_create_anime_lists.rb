class CreateAnimeLists < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_lists do |t|
      t.text :title
      t.text :title_kana
      t.text :image
      t.text :season
      t.text :media
      t.text :season_st
      t.text :release
      t.text :official_site_url
      t.text :official_twi
      t.text :episode_count
      t.text :story
      t.text :cv
      t.text :company
      t.text :broadcast
      t.text :watch_count

      t.timestamps
    end
  end
end
