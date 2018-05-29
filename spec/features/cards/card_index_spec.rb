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
