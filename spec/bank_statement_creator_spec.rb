require 'bank_statement_creator'

RSpec.describe BankStatementCreator do

  describe "#print_bank_statement" do
    it "displays an empty table if it is passed an empty record" do
      @bank_statement_creator = BankStatementCreator.new
      record = []
      expect{@bank_statement_creator.print_bank_statement(record)}.to output("date || credit || debit || balance \n ").to_stdout
    end

    it "displays headers and a formatted record with withdrawal amount in debit column" do
      @bank_statement_creator = BankStatementCreator.new
      record = [{:type => :withdraw, :amount => 10.00, :date => "10-01-2012", :new_balance => -10.00}]
      expected_display = "date || credit || debit || balance \n 10-01-2012 || || 10.00 || -10.00 \n "
      expect{@bank_statement_creator.print_bank_statement(record)}.to output(expected_display).to_stdout
    end

    it "displays headers and a formatted record with deposit amount in credit column" do
      @bank_statement_creator = BankStatementCreator.new
      record = [{:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00}]
      expected_display = "date || credit || debit || balance \n 10-01-2012 || 10.00 || || 10.00 \n "
      expect{@bank_statement_creator.print_bank_statement(record)}.to output(expected_display).to_stdout
    end

  end

end