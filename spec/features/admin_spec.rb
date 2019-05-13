require 'rails_helper'

RSpec.describe 'Bank', type: :feature do
  let!(:visit) { create :banknote }
  let!(:hundred)  { create :hundred, visit: banknote }
  let!(:fifty) { create :fifty, visit: banknote }
  let!(:twenty) { create :twenty, visit: banknote }
  let!(:ten) { create :ten, visit: banknote }

  describe 'admin' do
    before do
      visit admin_banknotes_path
    end

    it 'can see the Banknotetable' do
      expect(page).to have_content('Site Administration')
    end

     it 'can do edit Banknote table' do
      click_button 'Banknote'
      fill_in '2', with: banknot.quantity
      click_button 'Update Banknote'
      expect(page).to have_content('Banknote was update')
    end
  end
end
