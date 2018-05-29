require 'rails_helper'

feature 'card show page' do
  let(:card) { create(:card) }
  background do
    VCR.use_cassette('card_show') do
      VCR.use_cassette('card_pricing') do
        visit card_path(card)
      end
    end
  end

  it 'shows the card image' do
    expect(page).to have_css('.card')
  end

  it 'shows the card title' do
    expect(page).to have_content(card.name)
  end

  it 'shows the card price' do
    expect(page.html).to match(/\$\d*\.\d\d/)
  end
end
