class Account

  attr_reader :balance, :record

  def initialize(balance=Balance.new)
    @balance = balance
    @record = []
  end

  def deposit(amount, date_as_string)
    @balance.deposit(amount)
    create_record(:deposit, amount, date_as_string)
  end

  def withdraw(amount, date_as_string)
    @balance.withdraw(amount)
    create_record(:withdraw, amount, date_as_string)
  end

  private

  def create_record(type, amount, date_as_string)
    { :type => type,
      :amount => amount,
      :date => date_as_string,
      :new_balance => @balance.current_balance
    }
  end

end
