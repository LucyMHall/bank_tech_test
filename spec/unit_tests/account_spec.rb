# frozen_string_literal: true

require 'account'

RSpec.describe Account do
  before (:each) do
    @mock_bsc = double('BankStatementCreator', print_bank_statement: 'printing statement')


    @mock_balance = double('Balance', deposit: "#deposit called", withdraw: "withdraw called", current_balance: 0)


    @account = Account.new(@mock_bsc)


    @expected_deposit_ten_record = [{ type: :deposit, amount: 10.00, date: '10-01-2012', new_balance: 10.00 }]


    @expected_withdraw_ten_record = [{ type: :withdraw, amount: 10.00, date: '10-01-2012', new_balance: -10.00 }]
  end

  describe '#deposit' do
    it "stores a record of the transaction in the account's record property" do
      expect(@account.deposit(10.00, '10-01-2012')).to eq(@expected_deposit_ten_record)
    end
  end

  describe '#withdraw' do
    it "stores a record of the transaction in the account's record property" do
      expect(@account.withdraw(10.00, '10-01-2012')).to eq(@expected_withdraw_ten_record)
    end
  end

  describe '#print_statement' do
    it 'calls the print_bank_statement on the @bank_statement_creator' do
      expect(@account.print_statement).to eq('printing statement')
    end
  end

end
