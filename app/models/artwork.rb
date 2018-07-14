class Artwork < ApplicationRecord
  validates_presence_of :title, :artist
end
