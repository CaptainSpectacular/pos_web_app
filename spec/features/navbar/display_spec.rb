require 'rails_helper'

feature 'navbar content' do
  background do
    visit root_path
  end

  it 'has Home link' do
    expect(page).to have_link('Home')
    expect(page).to have_link('MTGInventory')
  end

  it 'has Browse Inventory link' do
    expect(page).to have_link('Browse Inventory')
  end

  it 'has Manage Inventory' do
    expect(page).to have_link('Manage Inventory')
  end

  it 'has login link for unauthenticated users' do
    expect(page).to have_link('Login')
  end
end

