class WithdrawalsController < ApplicationController

  def index
    @banknotes = Banknote.all
  end

  def create
    money  = Money.new(Banknote.to_h)
    result = money.withdraw(withdrawal_params[:amount].to_i)

    if result.any?
      Banknote.deduct(result)
      flash[:success] = 'The operation was successful'
    else
      flash[:danger]  = 'Not enough money in the account'
    end
    redirect_to root_path
  end

  private

  def withdrawal_params
    params.require(:withdrawal).permit!
  end
end
