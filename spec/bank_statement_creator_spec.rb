require 'bank_statement_creator'

RSpec.describe BankStatementCreator do

  before(:each) do
    @bank_statement_creator = BankStatementCreator.new
  end

  describe "#print_bank_statement" do
    it "displays an empty table if it is passed an empty record" do
      record = []
      expect{@bank_statement_creator.print_bank_statement(record)}.to output("date || credit || debit || balance \n ").to_stdout
    end

    it "displays headers and a formatted record with withdrawal amount in debit column" do
      record = [{:type => :withdraw, :amount => 10.00, :date => "10-01-2012", :new_balance => -10.00}]
      expected_display = "date || credit || debit || balance \n 10-01-2012 || || 10.00 || -10.00 \n "
      expect{@bank_statement_creator.print_bank_statement(record)}.to output(expected_display).to_stdout
    end

    it "displays headers and a formatted record with deposit amount in credit column" do
      record = [{:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00}]
      expected_display = "date || credit || debit || balance \n 10-01-2012 || 10.00 || || 10.00 \n "
      expect{@bank_statement_creator.print_bank_statement(record)}.to output(expected_display).to_stdout
    end

    it "displays the headers and multiple records when given more than 1 transaction" do
      record = [
        {:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00},
        {:type => :withdraw, :amount => 10.00, :date => "10-01-2012", :new_balance => 0.00}
      ]
      expected_display = "date || credit || debit || balance \n 10-01-2012 || 10.00 || || 10.00 \n 10-01-2012 || || 10.00 || 0.00 \n "
      expect{@bank_statement_creator.print_bank_statement(record)}.to output(expected_display).to_stdout
    end


  end

end
