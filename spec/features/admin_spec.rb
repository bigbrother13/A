require 'rails_helper'

RSpec.describe 'Movie', type: :feature do
  let!(:admin)  { create :admin }

  describe 'visitor' do
    before do
      visit admin_path
    end

    it 'can see the Banknotetable' do
      expect(page).to have_content('Bamknotes')
    end

     it 'can do edit Banknote table' do
      click_button 'Edit'
      fill_in '2', with: banknot.quantity
      click_button 'Update Banknote'
      expect(page).to have_content('Banknote was update')
    end
  end
end
