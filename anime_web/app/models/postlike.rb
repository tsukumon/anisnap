class Postlike < ApplicationRecord

  validates :user_id, {presence: true}
  validates :review_id, {presence: true}
  validates :like, {presence: true}

end
