class Artwork < ApplicationRecord
  validates_presence_of :title, :artist
  has_many :favorites
  has_many :users, through: :favorites

  def self.find_all_by_location(location)
    where(location: location)
  end

  def self.uniq_locations
    order(:location).pluck(:location).uniq
  end
end
