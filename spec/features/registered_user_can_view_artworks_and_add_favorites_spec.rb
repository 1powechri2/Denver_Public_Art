require 'rails_helper'

describe 'Registered user can view artworks and add them to favorites' do
  context 'Is registered' do
    it 'can add a favorite with rating and comment' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "dad's house")
      user = User.create(username: 'Muse', password: 'TooHot')

      visit user_user_artworks_path(user)

      expect(page).to have_content(art_one.title)
      expect(page).to have_content(art_one.artist)
      expect(page).to have_content(art_two.title)
      expect(page).to have_content(art_two.artist)
    end
  end
end
