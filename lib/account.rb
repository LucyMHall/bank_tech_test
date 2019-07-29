class Account

  attr_reader :balance

  def initialize(balance=Balance.new)
    @balance = balance
  end

end
