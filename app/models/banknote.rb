class Banknote < ApplicationRecord
  class << self
    def total
      money = 0
      all.each do |banknote|
        money += banknote.nominal * banknote.quantity
      end
      money
    end

    def deduct(notes)
      notes.each do |nominal|
        banknote = Banknote.find_by(nominal: nominal)
        banknote.quantity -= 1
        banknote.save
      end
    end

    def to_h
      result = Banknote.all.each_with_object({}) do |(banknote), memo|
        memo[banknote.nominal] = banknote.quantity
      end
    end
  end
end
