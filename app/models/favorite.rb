class Favorite < ApplicationRecord
  validates_presence_of :rating, :comment
  belongs_to :artwork
  belongs_to :user
end
