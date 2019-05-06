require 'rails_helper'

RSpec.describe 'Movie', type: :feature do
  let!(:admin)  { create :admin }

  describe 'visitor' do
    before do
      visit admin_path
    end

    it 'can see the Banknotetable' do
      expect(page).to have_content('Bamknote')
    end

     it 'can do edit Banknote table' do
      click_button 'Edit'
      expect(page).to have_content('Edit Banknote')
    end
  end
end
