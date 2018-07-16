require 'rails_helper'
describe 'registration flow' do
  it 'submits registration succesfully' do
    username = 'Jans_Arp'

    visit '/'

    click_on 'Create a New Account'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: 'flattened'

    click_on 'Create User'

    expect(page).to have_content("Welcome, #{username}!")
  end
end
