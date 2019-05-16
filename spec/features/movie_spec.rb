require 'rails_helper'

RSpec.describe Money do
  context 'get the right money' do
    it 'returns the chosen widthdraw path' do
      atm = Money.new(100 => 3, 50 => 3, 20 => 3, 10 => 3)
      expect(atm.withdraw(60)).to eq([10, 50])
    end

    it 'returns blank array if the amount is greater than the total' do
      atm = Money.new(100 => 3, 50 => 3, 20 => 3, 10 => 3)
      expect(atm.withdraw(10000)).to eq([])
    end
  end
end
