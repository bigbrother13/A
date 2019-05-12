class HomeController < ApplicationController
  def index
    @banknotes = Banknote.all
    @money = 0
    Banknote.all.each do |banknote|
      @money += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end
  end

  def withdrawal
    if calculate_money(params[:amount].to_i)
      flash[:success] = 'The operation was successful'
    elsif
      flash[:danger]  = 'Not enough money in the account'
    else
      flash[:info]    = 'Not enough banknotes'
      
    end

    redirect_to home_path
  end

  private

  def calculate_money(amount)
    @banknote = Banknote.all

    max_cash = 0

    Banknote.all.each do |banknote|
      max_cash += Banknote::NOMINAL[banknote.name] * banknote.quantity
    end

    if amount < max_cash
      @banknote.each do |banknote|
        banknote_name = Banknote::NOMINAL[banknote.name]
        expected = amount / banknote_name

        if expected > banknote.quantity
          amount = amount - (banknote.quantity * banknote_name)
          banknote.quantity = 0
        else
          amount = amount - (banknote_name * expected)
          banknote.quantity -= expected
        end

        banknote.save
      end
    else
      false
    end
  end
end


