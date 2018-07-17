class Artwork < ApplicationRecord
  validates_presence_of :title, :artist

  def self.find_all_by_location(location)
    where(location: location)
  end

  def self.uniq_locations
    pluck(:location).uniq
  end
end
