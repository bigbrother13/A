class Banknote < ApplicationRecord

  def total
    @money = 0
    Banknote.all.each do |banknote|
      @money += banknote.nominal * banknote.quantity
    end
  end  


end
