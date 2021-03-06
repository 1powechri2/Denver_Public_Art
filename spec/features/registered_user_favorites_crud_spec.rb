require 'rails_helper'

describe 'Registered user can view artworks and add them to favorites' do
  context 'Is registered' do
    it 'can see the index for users' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      art_two = Artwork.create(title: "13 Dead Birds", artist: "Kelly", location: "dad's house")
      user = User.create(username: 'Muse', password: 'TooHot')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_artworks_path(user)

      expect(page).to have_content(art_one.title)
      expect(page).to have_content(art_one.artist)
      expect(page).to have_content(art_two.title)
      expect(page).to have_content(art_two.artist)
    end
    it 'can see the individual locations page for users' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      user = User.create(username: 'Muse', password: 'TooHot')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_locales_path(user)

      click_on 'hell'

      expect(current_path).to eq(user_locale_path(user))
    end
    it 'can click on an artwork at an individual location and create a favorite with rating and comment' do
      art_one = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      user = User.create(username: 'Muse', password: 'TooHot')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_locales_path(user)

      click_on 'hell'

      click_on "Add to Favorites"

      expect(current_path).to eq(new_user_artwork_favorite_path(user, art_one))

      select 4, from: 'rating'
      fill_in :favorite_comment, with: 'this is awesome'
      click_on "Create Favorite"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("God's Hand")
      expect(page).to have_content("Rating: 4")
      expect(page).to have_content("Comment: this is awesome")
    end
    it 'can update a favorite from the user show page' do
      art = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      user = User.create(username: 'Muse', password: 'TooHot')
      favorite = Favorite.create(rating: 3, comment: 'hghg', artwork_id: art.id, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'Edit Favorite'

      expect(current_path).to eq(edit_user_artwork_favorite_path(user, art, favorite))

      select 2, from: 'rating'
      fill_in :favorite_comment, with: 'not soo much'
      click_on "Update Favorite"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("God's Han")
      expect(page).to have_content("Rating: 2")
      expect(page).to have_content("Comment: not soo much")
    end
    it 'can update a favorite from the user show page' do
      art = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      user = User.create(username: 'Muse', password: 'TooHot')
      favorite = Favorite.create(rating: 3, comment: 'hghg', artwork_id: art.id, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on 'Delete Favorite'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content('You have no favorites, choose art you like and add it to your favorites') 
    end
  end
end
