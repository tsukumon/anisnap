class Contact < ApplicationRecord

  validates :name, {presence: true, length: { in: 1..25 }}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: {with: VALID_EMAIL_REGEX}}

  validates :subject, {presence: true, length: { in: 1..50 }}

  validates :message, {presence: true, length: { in: 1..800 }}


end
