class Banknote < ApplicationRecord

  def self.from_the_class
    @money = 0
    Banknote.all.each do |banknote|
      @money += banknote.nominal * banknote.quantity
    end
    @money
  end 

end
