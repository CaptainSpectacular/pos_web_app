require 'rails_helper'

feature 'user can add cards to inventory' do
  let(:card)      { create(:card) }
  let(:inventory) { create(:inventory) }

  context 'the user logs in and visits a card show' do
    background do
      user = inventory.user
      visit new_user_session_path
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    context 'they try to add the card to their inventory' do
      background do
        VCR.use_cassette('user_adds_card') do
          visit card_path(card)
          fill_in 'quantity[integer]', with: 5
          click_button 'Add to Inventory'
        end
      end

      scenario 'the user\'s inventory gets updated' do
        expect(inventory.cards.size).to eq(1)
        expect(inventory.quantity(card)).to eq(5)
      end
    end
  end
end
