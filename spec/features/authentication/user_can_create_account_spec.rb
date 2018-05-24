require 'rails_helper'

feature 'registration' do
  background do
    visit new_user_registration_path 
  end

  describe 'a user creates an account' do
    describe 'visitig the page' do
      it 'has a registration form' do
        expect(page).to have_link('Log in')
        expect(page).to have_field('Email')
        expect(page).to have_field('Password')
        expect(page).to have_field('Password confirmation')
        expect(page).to have_button('Sign up')
      end
    end

    describe 'filling out the form with valid info' do
      it 'creates a new user' do
        expect(User.all.size).to eq(0)

        fill_in 'Email',                 with: 'some_email@email.com'
        fill_in 'Password',              with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect(User.all.size).to eq(1)
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Logout')
      end
    end

    describe 'filling out the form with invalid info' do
      it 'needs a valid email format' do
        expect(User.all.size).to eq(0)

        fill_in 'Email',                 with: 'some_emailemail.com'
        fill_in 'Password',              with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect(User.all.size).to eq(0)
        expect(page).to have_button('Sign up')
      end

      scenario 'password must be at least 6 digits' do
        expect(User.all.size).to eq(0)

        fill_in 'Email',                 with: 'some_email@email.com'
        fill_in 'Password',              with: '12345'
        fill_in 'Password confirmation', with: '12345'
        click_button 'Sign up'

        expect(User.all.size).to eq(0)
        expect(page).to have_button('Sign up')
      end

      scenario 'passwords must match' do
        expect(User.all.size).to eq(0)

        fill_in 'Email',                 with: 'some_email@email.com'
        fill_in 'Password',              with: 'password'
        fill_in 'Password confirmation', with: 'Password'
        click_button 'Sign up'

        expect(User.all.size).to eq(0)
        expect(page).to have_button('Sign up')
      end
    end
  end

  context 'a user already has an account' do
    scenario 'they can click the sign in link' do
      click_on 'Log in'

      expect(current_path).to eq(new_user_session_path)
    end
  end
end
