  class Money
    attr_accessor :banknote

    def initialize(banknote)
      @banknote = banknote
    end

    def calculate(amount)
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