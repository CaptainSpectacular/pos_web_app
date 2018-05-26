require 'rails_helper'

feature 'navbar content' do
    background do
      visit root_path
    end

  describe 'an unauthenticated user' do
    it 'has Home link' do
      expect(page).to have_link('Home')
      expect(page).to have_link('MTGInventory')
    end

    it 'has login link' do
      expect(page).to have_link('Login')
    end

    it 'does not have logout' do
      expect(page).to_not have_link('Logout')
    end

    it 'does not have profile link' do
      expect(page).to_not have_link('My Profile')
    end
  end

  describe 'a logged in user' do
    background do
      user = create(:user)
      click_on 'Login'
      fill_in  'Email',    with: user.email 
      fill_in  'Password', with: user.password
      click_on 'Log in'
    end

    it 'has a logout link' do
      expect(page).to have_link('Logout')
    end

    it 'does not have a login link' do
      expect(page).to_not have_link('Login')
    end

    it 'has Inventory' do
      expect(page).to have_link('Inventory')
    end
  end
end

