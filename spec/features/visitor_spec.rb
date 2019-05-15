
require 'rails_helper'

RSpec.describe 'Bank', type: :feature do
  let!(:hundred) { create :banknote, name: 'hundred', quantity: 5 }
  let!(:fifty)   { create :banknote, name: 'fifty', quantity: 6 }
  let!(:twenty)  { create :banknote, name: 'twenty', quantity: 7 }
  let!(:ten)     { create :banknote, name: 'ten', quantity: 9 }

  before do
    visit root_path
  end

  it 'can see the Bank page' do
    expect(page).to have_content('Bank')
  end

  it 'can see the total amount in the ATM' do
    expect(page).to have_content('Total: 1030')
  end

  it 'can withdraw money' do
    fill_in 'Amount', with: '100'
    click_button 'Withdraw'
    expect(page).to have_content('The operation was successful')
    expect(page).to have_content('Total: 930')
  end 

  it 'when not enough money' do
    fill_in 'Amount', with: '100000'
    click_button 'Withdraw'
    expect(page).to have_content('Not enough money in the account')
    expect(page).to have_content('Total: 1030')
  end 
end
