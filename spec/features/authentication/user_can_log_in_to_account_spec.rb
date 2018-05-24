require 'rails_helper'

feature 'Logging in' do
  background do
    visit new_user_session_path
  end

  describe 'a user logging in' do
    describe 'the form' do
      it 'has a login form' do
        expect(page).to have_link('Sign up')
        expect(page).to have_content('Remember me')
        expect(page).to have_field('Email')
        expect(page).to have_field('Password')
      end
    end

    describe 'login attempts' do
      let(:user) { create(:user) }

      it 'is successfull with valid credentials' do
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'

        expect(current_path).to eq(root_path)
        expect(page).to have_content('Logout')
      end

      it 'is not successfull with invalid credentials' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'somepassword'
        click_button 'Log in'

        expect(current_path).to eq(new_user_session_path)
        expect(page).to_not have_content('Logout')
      end
    end
  end

  describe 'a user does not have an account and wants to make one' do
    scenario 'then can click the sign up link' do
      click_link 'Sign up'

      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
