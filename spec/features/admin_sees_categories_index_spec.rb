require 'rails_helper'

describe 'User visits artythings index page' do
  context 'as admin' do
    it 'allows admin to see all artythings' do
      admin = User.create(username: "Beau", password: "boohoo", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_artworks_path

      expect(page).to have_content("Admin Artythings")
    end
  end
  context 'as default user' do
    it 'does not allow default user to see admin artythings index' do
      user = User.create(username: "Buck", password: "password")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_artworks_path

      expect(page).to_not have_content("Admin Artythings")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
