require 'rails_helper'

describe 'A user visits the index page' do
  context 'it clicks a link to see artwork by location' do
    it 'sees a list of locations' do
      user = User.create(username: 'Muse', password: 'TooHot')
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "Hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Dad's House")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_artworks_path(user)

      click_link "Artwork by Location"

      expect(current_path).to eq(locations_path)
      expect(page).to have_content("Hell")
      expect(page).to have_content("Dad's House")
    end
  end
  context 'it visits a list of locations' do
    it 'clicks a location to see all artworks of that location' do
      user = User.create(username: 'Muse', password: 'TooHot')
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "Hell")
      art_two = Artwork.create(title: "Fun Goop", artist: "Melvin", location: "Hell")
      art_three = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "Dad's House")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit locations_path

      click_on "Hell"

      expect(current_path).to eq('/location')
      expect(page).to have_content(art_one.title)
      expect(page).to have_content(art_two.title)
    end
  end
end
