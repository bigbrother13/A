require 'rails_helper'

RSpec.describe 'Movie', type: :feature do
  let!(:admin)  { create :admin }

  describe 'visitor' do
    before do
      visit admin_path
    end

    it 'can see the All users table' do
      expect(page).to have_content('User Table')
    end
  end
end