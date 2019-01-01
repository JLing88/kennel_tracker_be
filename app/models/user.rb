class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  enum role: [:user, :admin]
end
