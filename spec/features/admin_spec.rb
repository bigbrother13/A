require 'rails_helper'

RSpec.describe 'Bank', type: :feature do

  describe 'admin' do
    before do
      admin_banknotes_path
    end

    it 'can see the Banknotetable' do
      expect(page).to have_content('Site Administration')
    end

     it 'can do edit Banknote table' do
      click_button 'Banknotes'
      click_button 'Edit'
      fill_in 'ten', with: banknot.name
      fill_in '5', with: banknot.quantity
      click_button 'Save'
      expect(page).to have_content('Banknote successfully updated')
    end
  end
end
