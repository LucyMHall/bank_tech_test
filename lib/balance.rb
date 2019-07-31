# frozen_string_literal: true

class Balance
  attr_reader :current_balance

  def initialize
    @current_balance = 0.00
  end

  def deposit(amount)
    @current_balance += amount
  end

  def withdraw(amount)
    if insufficient_funds?(amount)
      raise "You do not have sufficient funds"
    else
      @current_balance -= amount
    end
  end

  private

  def insufficient_funds?(amount)
    amount > @current_balance
  end
end
