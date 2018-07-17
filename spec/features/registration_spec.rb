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
  it 'can log in as a registered user' do
    user = User.create(username: "Chros", password: "4p9ybaos")
    visit '/'
    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Log Out")
  end
  it 'can log out as a registered user' do
    user = User.create(username: "Chros", password: "4p9ybaos")
    visit '/'
    click_on "I already have an account"

    expect(current_path).to eq(login_path)
    fill_in "username", with: user.username
    fill_in "password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end
