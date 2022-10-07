class User < ApplicationRecord
  authenticates_with_sorcery!
  before_save { self.email = email.downcase }

  has_many :reservations, dependent: :destroy

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :last_name, presence: true, length: { maximum: 255 }
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name_kana, presence: true, length: { maximum: 255 }
  validates :first_name_kana, presence: true, length: { maximum: 255 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, format: { with: VALID_PHONE_REGEX }, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, presence: true
end
