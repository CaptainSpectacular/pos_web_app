require 'rails_helper'

feature 'index' do
  let(:user) { create(:user) }
  let(:card) { create(:card) }

  background do
    user.inventories.create(name: 'thingy')
    user.inventories.create(name: 'ringy')
    user.inventories.create(name: 'dingy')
    inventory = user.inventories.first
    inventory.cards << card

    visit new_user_session_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit inventories_path
  end

  it 'has header info' do
    expect(page).to have_content('Manage Inventories')
    expect(page).to have_content('Name')
    expect(page).to have_content('#Unique Cards')
  end

  it 'shows inventory names' do
    user.inventories.each do |inventory|
      expect(page).to have_content(inventory.name)
    end
  end

  it 'shows inventory # of unique cards' do

    expect(page).to have_content(1)
    expect(page).to have_content(0)
  end
end
