class User < ApplicationRecord
  before_save { self.email = email.downcase }       # this callback is called before saving data to db.

  validates :name, presence: true, length: {maximum:  50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true, length: {minimum: 6}
  # why does putting this validation works, if its declared below ??
  has_secure_password
end
