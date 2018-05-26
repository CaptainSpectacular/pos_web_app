require 'rails_helper'

feature 'card show page' do
  let(:card) { create(:card) }
  background do
    visit card_path(card)
  end

  it 'shows the card image' do
    expect(page).to have_css('.card')
  end

  it 'shows the card title' do
    expect(page).to have_content(card.name)
  end
end
