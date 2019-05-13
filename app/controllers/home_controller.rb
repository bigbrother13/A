class HomeController < ApplicationController

  def index
    @banknotes = Banknote.all
    @money = 0
    Banknote.all.each do |banknote|
      @money += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end
  end

  def withdrawal
    @money = Money.new(options: money_params)
    if @money.to_i
      flash[:success] = 'The operation was successful'
    elsif
      flash[:danger]  = 'Not enough money in the account'
    else
      flash[:info]    = 'Not enough banknotes' 
    end

    redirect_to home_path
  end

  private

  def money_params
    params[:money] 
  end
end


