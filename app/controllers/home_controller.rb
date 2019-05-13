class HomeController < ApplicationController

  def index
    @banknotes = Banknote.all
    @money = 0
    Banknote.all.each do |banknote|
      @money += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end
  end

  def withdrawal
    @money = Money.new(params)
    if @money.calculate(params['amount'].to_i)
      flash[:success] = 'The operation was successful'
    else
      flash[:danger]  = 'Not enough money in the account'
    end

    redirect_to home_path
  end

  private

  def money_params
    params [:money]
  end
end


