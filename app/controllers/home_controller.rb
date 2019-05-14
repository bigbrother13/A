class HomeController < ApplicationController

  def index
    @banknotes = Banknote.all
    @money = 0
    Banknote.all.each do |banknote|
      @money += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end
  end

  def withdrawal
    @money = Money.new(money_params)
    binding.pry
    if result = @money.withdraw(params['amount'].to_i)
      result.each do |nominal|
        banknote = Banknote.find_by(name: Banknote::NOMINAL.key(nominal))
        banknote.quantity -= 1
        banknote.save
      end
      flash[:success] = 'The operation was successful'
    else
      flash[:danger]  = 'Not enough money in the account'
    end

     redirect_to home_path
  end

  private

  def money_params
    result = Banknote.all.each_with_object({}) do |(banknote), memo|
      memo[Banknote::NOMINAL[banknote.name]] = banknote.quantity
    end    
  end
end
