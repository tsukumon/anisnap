class AnimeList < ApplicationRecord

  mount_uploader :image, AnimeUploader

  def self.search(search)
    return AnimeList.all unless search
    AnimeList.where(['content LIKE ?', "%#{search}%"])
  end

  validates :title, {presence: true}

end
