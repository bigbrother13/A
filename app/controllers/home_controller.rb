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

    # @money = Money.new(params)
    if @money.withdraw(money_params['amount'].to_i)
      flash[:success] = 'The operation was successful'
    else
      flash[:danger]  = 'Not enough money in the account'
    end

     redirect_to home_path
  end

  private

  def money_params
    # result = {}
    #  Banknote.all.each do |banknote|
    #   result[Banknote::NOMINAL[v]] = Banknote[v]
    # end

    result = Banknote.all.each_with_object({}) do |(banknote), memo|
      memo[Banknote::NOMINAL[banknote.name]] = banknote.quantity if Banknote[banknote.name]
    end    
  end
end
