require 'rails_helper'

describe 'A user visits the index page' do
  context 'it clicks a link to see artwork by location' do
    it 'sees a list of locations' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "Hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Hell")

      visit artworks_path

      click_link "Artwork by Location"

      expect(current_path).to eq(locations_path)
      expect(page).to have_content("God's Hand")
      expect(page).to have_content("13 Dead Birds")
    end
  end
end
