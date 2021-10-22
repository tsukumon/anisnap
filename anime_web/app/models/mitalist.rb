class Mitalist < ApplicationRecord

  validates :user_id, {presence: true}
  validates :anime_id, {presence: true}
  validates :state, {presence: true}


end
