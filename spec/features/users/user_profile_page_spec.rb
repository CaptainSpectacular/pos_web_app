require 'rails_helper'

feature 'User profile page' do
  let(:inventory) { create(:inventory) }
  let(:user) { inventory.user }

  background do
    visit new_user_session_path 
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit profile_path
  end

  context 'a logged in user can view their page' do
    scenario 'they see some stats' do
      expect(page).to have_content(user.email)
    end
  end
end
