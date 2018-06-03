require 'rails_helper'

feature 'inventory show page' do
  describe 'a logged in user' do
    context 'visiting one of their inventory show pages' do
      let(:inventory) { create(:inventory) }

      background do 
        user = inventory.user
        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        visit inventory_path(inventory)
      end

      scenario 'they see statistics' do
        expect(page).to have_content(inventory.name)
        expect(page).to have_content(inventory.total_items)
      end

      scenario 'they see the options to import to the inventory' do
        expect(page).to have_content('Import from CSV')
        expect(page).to have_button('Import CSV')
      end
    end
  end
end
