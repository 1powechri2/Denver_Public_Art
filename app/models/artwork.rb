class Artwork < ApplicationRecord
  validates_presence_of :title, :artist

  def self.find_all_by_location(location)
    where(location: location)
  end

  def self.uniq_locations
    order(:location).pluck(:location).uniq
  end
end
