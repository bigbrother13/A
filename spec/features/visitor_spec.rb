
require 'rails_helper'

RSpec.describe 'Bank', type: :feature do
  let!(:hundred) { create :banknote, nominal: 100, quantity: 3 }
  let!(:fifty)   { create :banknote, nominal: 50,  quantity: 3 }
  let!(:twenty)  { create :banknote, nominal: 20,  quantity: 3 }
  let!(:ten)     { create :banknote, nominal: 10,  quantity: 3 }

  before do
    visit root_path
  end

  it 'can see the Bank page' do
    expect(page).to have_content('To')
  end

  it 'can see the total amount in the ATM' do
    expect(page).to have_content('Total: 540')
  end

  it 'can withdraw money' do
    fill_in 'Amount', with: '100'
    click_button 'Withdraw'
    expect(page).to have_content('The operation was successful')
    expect(page).to have_content('Total: 440')
  end 

  it 'when not enough money' do
    fill_in 'Amount', with: '10000'
    click_button 'Withdraw'
    expect(page).to have_content('Not enough money in the account')
    expect(page).to have_content('Total: 540')
  end 
end
