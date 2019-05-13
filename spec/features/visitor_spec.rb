
require 'rails_helper'

RSpec.describe 'Bank', type: :feature do
    let!(:banknote)   { create :banknote }
    let!(:hundred) { create :hundred, banknote: banknote }
    let!(:fifty) { create :fifty, banknote: banknote }
    let!(:twenty) { create :twenty, banknote: banknote }
    let!(:ten) { create :ten, banknote: banknote }
    
  before do
    visit home_path
  end

  it 'can see the Bank page' do
    expect(page).to have_content('Bank')
  end

  it 'can withdraw money' do
    fill_in 'Сalculate for', with: '100'
    click_button 'withdrawal money'
    expect(page).to have_content('The operation was successful')
  end 

  it 'when not enough money' do
    fill_in 'Сalculate for', with: '100000'
    click_button 'withdrawal money'
    expect(page).to have_content('Not enough money in the account')
  end 
end
