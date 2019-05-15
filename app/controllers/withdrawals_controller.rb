class WithdrawalsController < ApplicationController

  def index
    @banknotes = Banknote.all
    Bancnote.self
  end

  def create
    @money = Money.new(money_params)
    if result = @money.withdraw(withdrawal_params[:amount].to_i)
      result.each do |nominal|
        banknote = Banknote.find_by(nominal: nominal)
        banknote.quantity -= 1
        banknote.save
      end
      flash[:success] = 'The operation was successful'
    else
      flash[:danger]  = 'Not enough money in the account'
    end

     redirect_to root_path
  end

  private

  def money_params
    result = Banknote.all.each_with_object({}) do |(banknote), memo|
      memo[banknote.nominal] = banknote.quantity
    end    
  end

  def withdrawal_params
    params.require(:withdrawal).permit!
  end
end
