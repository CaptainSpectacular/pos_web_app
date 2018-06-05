require 'rails_helper'

feature 'card index page' do
  background do 
    create_list(:card, 26) 
    visit cards_path
  end

  context 'a user should see all MTG cards' do
    scenario 'they see 25 cards per page' do
      expect(page).to have_css('.card-list', count: 25)
      expect(page).to have_link(Card.first.name)
      expect(page).to have_content('Previous')
      expect(page).to have_content('Next')
      expect(page).to have_content('Displaying Card 1 - 25 of 26 in total')
    end

    scenario 'they see two pages' do
      expect(page).to have_link(2)
    
      click_on 'Next'

      expect(page).to have_css('.card-list', count: 1)
    end
  end

  context 'a user can sort' do
    scenario 'by set' do
      expect(page).to have_link('Sort by Set')
    end

    scenario 'by color' do
      expect(page).to have_link('Sort by Color')
    end

    scenario 'by name' do
      expect(page).to have_link('Sort by Name')
    end
  end
end
