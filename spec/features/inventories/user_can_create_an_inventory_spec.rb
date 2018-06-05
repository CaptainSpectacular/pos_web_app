require 'rails_helper'

feature 'user can create an inventory' do
  let(:user) { create(:user) }

  describe 'a logged in user creates an inventory' do
    background do
      visit new_user_session_path
      fill_in 'Email',   with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
      visit inventories_path
    end

    scenario 'they do it from the index' do
      click_on 'Add'
      fill_in 'Name', with: 'Pyrex'
      click_on 'Save Inventory'

      expect(page).to have_content('Pyrex')
      expect(user.inventories.size).to eq(1)
    end

    scenario 'they want to cancel out of creation' do
      click_on 'Add'
      fill_in 'Name', with: 'Pyrex'
      click_on 'Close'

      expect(page).to_not have_content('Pyrex')
      expect(user.inventories.size).to eq(0)
    end
  end
end
