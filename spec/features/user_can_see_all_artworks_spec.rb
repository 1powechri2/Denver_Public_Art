require 'rails_helper'

describe 'A user can see all artworks on index page' do
  context 'A user visits the index page' do
    it 'sees a list of all the public artworks' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "dad's house")

      visit artworks_path

      expect(page).to have_content("Title: #{art_one.title}")
      expect(page).to have_content("Title: #{art_one.artist}")
      expect(page).to have_content("Title: #{art_one.location}")
      expect(page).to have_content("Title: #{art_two.title}")
      expect(page).to have_content("Title: #{art_two.artist}")
      expect(page).to have_content("Title: #{art_two.location}")
    end
  end
end
