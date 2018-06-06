require 'rails_helper'

feature 'card show page' do
  let(:card) { create(:card) }
  context 'a visitor' do
    background do
      VCR.use_cassette('card_show') do
        VCR.use_cassette('card_pricing') do
          visit card_path(card)
        end
      end
    end

    xit 'shows the card image' do
      expect(page).to have_css('.card')
    end

    it 'shows the card title' do
      expect(page).to have_content(card.name)
    end

    xit 'shows the card price' do
      expect(page.html).to match(/\$\d*\.\d\d/)
    end

    it 'does not show the option to add to inventory' do
      expect(page).to_not have_button('Add to Inventory')
    end
  end

  context 'a logged in user' do
    let(:inventory) { create(:inventory) }

    background do
      user = inventory.user
      visit new_user_session_path
      fill_in 'Email',    with: user.email 
      fill_in 'Password', with: user.password 
      click_on 'Log in'

      VCR.use_cassette('card_show') do
        VCR.use_cassette('card_pricing') do
          visit card_path(card)
        end
      end
    end

    it 'shows the option to add the card to the inventory' do
      expect(page).to have_button('Add to Inventory')
    end
  end
end
