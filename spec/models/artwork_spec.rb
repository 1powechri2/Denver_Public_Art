require 'rails_helper'

describe Artwork do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:artist)}
  end
  describe 'class methods' do
    it 'can find all artworks by location' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "Hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Hell")

      location = "Hell"

      expect(Artwork.find_all_by_location(location)).to eq([art_one, art_two])
    end
    it 'can find all unique locations' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "Hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Hell")
      art_three = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Dad's House")

      expect(Artwork.uniq_locations).to eq(["Hell", "Dad's House"])
    end
  end
end
