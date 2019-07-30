# frozen_string_literal: true

require 'balance'

RSpec.describe Balance do
  before (:each) do
    @balance = Balance.new
  end

  describe '#initialize' do
    it 'initializes at 0.00' do
      expect(@balance.current_balance).to eq(0.00)
    end
  end

  describe '#deposit' do
    it 'increases the balance by the amount specifed' do
      expect{@balance.deposit(10.00)}.to change{@balance.current_balance}.by(10.00)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance by the amount specifed' do
      expect{@balance.withdraw(10.00)}.to change{@balance.current_balance}.by(-10.00)
    end
  end
end
