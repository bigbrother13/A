class HomeController < ApplicationController
  def index
    @money = 0

    Banknote.all.each do |banknote|
      @money += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end
  end

  def withdrawal
 	
  end

end