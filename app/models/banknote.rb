class Banknote < ApplicationRecord

  def self.from_the_class
    @money = 0
    all.each do |banknote|
      @money += banknote.nominal * banknote.quantity
    end
    @money
  end

  def self.from_the_result
      result.each do |nominal|
        banknote = Banknote.find_by(nominal: nominal)
        banknote.quantity -= 1
        banknote.save
      end
  end
end

hello = Banknote.new(@money.withdraw(withdrawal_params[:amount].to_i)
hello.from_the_result



