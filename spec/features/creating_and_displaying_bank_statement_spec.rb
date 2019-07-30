require 'spec_helper.rb'
require 'account'
require 'balance'
require 'bank_statement_creator'

describe "Printing bank statement" do
  it "User can see their transaction activity in their statement" do
    @new_account = Account.new
    @new_account.deposit(20, "10-07-2019")
    @new_account.withdraw(10, "11-07-2019")
    @new_account.deposit(3, "12-08-2019")
    expected_display =
                      "date || credit || debit || balance \n " +
                      "12-08-2019 || 3.00 || || 13.00 \n " +
                      "11-07-2019 || || 10.00 || 10.00 \n " +
                      "10-07-2019 || 20.00 || || 20.00 \n "
    expect{@new_account.print_statement}.to output(expected_display).to_stdout
  end
end
