require 'rails_helper'

feature 'card index page' do
  context 'a user should see all MTG cards' do
    xscenario 'find out how to test this' do

    end
  end

  context 'a user can sort' do
    scenario 'by set' do
      expect(page).to have_content('Sort by Set')
    end

    scenario 'by color' do
      expect(page).to have_content('Sort by Color')
    end

    scenario 'by name' do
      expect(page).to have_content('Sort by Name')
    end
  end
end
