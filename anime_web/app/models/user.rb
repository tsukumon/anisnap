class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable,:authentication_keys => [:login]

  mount_uploader :image, ImageUploader
  mount_uploader :bgimage, ImageUploader

  include FriendlyId
  friendly_id :userid

  VALID_NAME_ID_REGEX = /\A[a-zA-Z0-9_]+\z/
  validates :username, {presence: true, length: { in: 1..25 }}
  validates :userid, {presence: true, uniqueness: { case_sensitive: false } , length: { in: 3..15 }, format: {with: VALID_NAME_ID_REGEX}}

  #自己紹介
  validates :intro, length: { maximum: 100 }



  #メールまたはユーザーIDでログイン
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(userid) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
      def send_on_create_confirmation_instructions
        generate_confirmation_token!  unless @raw_confirmation_token
        send_devise_notification(:confirmation_on_create_instructions, @raw_confirmation_token, {})
      end


end
