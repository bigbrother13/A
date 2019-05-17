class Banknote < ApplicationRecord
  class << self
    def total
      all.inject(0) { |sum, nominal| sum + nominal.nominal * nominal.quantity }
    end

    def deduct(notes)
      grouped = notes.group_by { |a| a }.map { |k, v| [k, v.size] }.to_h
      grouped.each do |nominal, quantity|
        banknote = Banknote.find_by(nominal: nominal)
        banknote.quantity -= quantity
        banknote.save
      end
    end

    def to_h
      all.map { |a| [a.nominal, a.quantity] }.to_h
    end
  end
end
