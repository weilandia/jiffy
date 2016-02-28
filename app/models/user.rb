class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :role,     presence:   true

  has_many :favorites
  has_many :jifs, through: :favorites

  enum role: %w(default admin)
end
