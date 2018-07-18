 class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  
  has_many :favorites
  has_many :artworks, through: :favorites

  enum role: %w(default admin)

  has_secure_password
end
