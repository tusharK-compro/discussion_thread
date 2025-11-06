class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :replies

  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
end