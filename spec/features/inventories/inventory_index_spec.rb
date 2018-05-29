require 'rails_helper'
feature 'index' do

  let(:user) do
    create :user
  end

  background do
    visit new_user_sessions_path
    fill_in "Email", with: user.email
    fill_in "Passoword", with: user.password
    click_on "Log in"
    visit inventories_path
    user.inventories.create(name: "thingy")
  end

  it 'should show inventories when logged in' do
    expect(page).to have_content(user.inventories.first.name)
  end
end