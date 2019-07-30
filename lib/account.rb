class Account

  attr_reader :balance, :record

  def initialize(bank_statement_creator=BankStatementCreator.new, balance=Balance.new)
    @balance = balance
    @record = []
    @bank_statement_creator = bank_statement_creator
  end

  def deposit(amount, date_as_string)
    @balance.deposit(amount)
    created_record = create_record(:deposit, amount, date_as_string)
    store_record(created_record)
  end

  def withdraw(amount, date_as_string)
    @balance.withdraw(amount)
    created_record = create_record(:withdraw, amount, date_as_string)
    store_record(created_record)
  end


  private

  def create_record(type, amount, date_as_string)
    { :type => type,
      :amount => amount,
      :date => date_as_string,
      :new_balance => @balance.current_balance
    }
  end

  def store_record(record)
    @record << record
  end

end
