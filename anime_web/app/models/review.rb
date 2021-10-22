class Review < ApplicationRecord

  is_impressionable counter_cache: true

  validates :kansou, {presence: true, length: {maximum: 600}}

  validates :user_id, {presence: true}

  validates :state, {presence: true}

  validates :total, {presence: true}

  validates :draw, {presence: true,  :numericality => {:greater_than_or_equal_to => 1 , :less_than_or_equal_to => 5}}

  validates :music, {presence: true, :numericality => {:greater_than_or_equal_to => 1 , :less_than_or_equal_to => 5}}

  validates :voice, {presence: true, :numericality => {:greater_than_or_equal_to => 1 , :less_than_or_equal_to => 5}}

  validates :chara, {presence: true, :numericality => {:greater_than_or_equal_to => 1 , :less_than_or_equal_to => 5}}

  validates :story, {presence: true, :numericality => {:greater_than_or_equal_to => 1 , :less_than_or_equal_to => 5}}

  validates :animetitle, {presence: true}

  validates :anime_id, {presence: true}

end
