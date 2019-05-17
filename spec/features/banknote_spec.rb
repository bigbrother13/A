require 'rails_helper'

RSpec.describe 'Banknote' do
  let!(:hundred) { create :banknote, nominal: 100, quantity: 3 }
  let!(:fifty)   { create :banknote, nominal: 50,  quantity: 3 }
  let!(:twenty)  { create :banknote, nominal: 20,  quantity: 3 }
  let!(:ten)     { create :banknote, nominal: 10,  quantity: 3 }

  it 'returns the chosen widthdraw path' do
    expect(Banknote.total).to eq(540)
  end

  it 'get the necessary bills' do
    Banknote.deduct([50,50])
    banknote = Banknote.find_by(nominal: 50)
    expect(banknote.quantity).to eq(1)
  end

  it 'pass parameters to hash' do
    expect(Banknote.to_h).to eq({100=>3, 50=>3, 20=>3, 10=>3})
  end
end
