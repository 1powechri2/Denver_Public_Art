require 'rails_helper'

describe 'User visits artythings index page' do
  context 'as admin' do
    it 'allows admin to see all categories and create a new one' do
      art = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      admin = User.create(username: "Beau", password: "boohoo", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artworks_path

      expect(page).to have_content("Admin Artythings")

      click_on 'Create New Artything'

      fill_in :artwork_title, with: 'Hell Yes'
      fill_in :artwork_artist, with: 'Dood'
      fill_in :artwork_location, with: 'Dad Hauz'

      click_on 'Create New Artything'

      expect(current_path).to eq(admin_artworks_path)
      expect(page).to have_content('Hell Yes')
    end
    it 'allows admin to see all categories and update one' do
      art = Artwork.create(title: "God's Hand", artist: "Melvin", location: "hell")
      admin = User.create(username: "Beau", password: "boohoo", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artworks_path

      expect(page).to have_content("Admin Artythings")

      click_on 'Update Artything'

      fill_in :artwork_title, with: 'Hell Yes'
      fill_in :artwork_artist, with: 'Dood'
      fill_in :artwork_location, with: 'Dad Hauz'

      click_on 'Update Artything'

      expect(current_path).to eq(admin_artworks_path)
      expect(page).to have_content('Hell Yes')
    end
  end
end
