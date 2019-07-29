class Account

  attr_reader :balance

  def initialize(balance=Balance.new)
    @balance = balance
  end

  def deposit(amount, date_as_string)
    @balance.deposit(amount)
    store_record(:deposit, amount, date_as_string)
  end

  private

  def store_record(type, amount, date_as_string)
    { :type => type,
      :amount => amount,
      :date => date_as_string,
      :new_balance => @balance.current_balance
    }
  end

end
