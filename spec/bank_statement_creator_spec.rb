require 'bank_statement_creator'

RSpec.describe BankStatementCreator do

  describe "#print_bank_statement" do
    it "displays an empty table if it is passed an empty record" do
      @bank_statement_creator = BankStatementCreator.new
      record = []
      expect{@bank_statement_creator.print_bank_statement(record)}.to output("date || credit || debit || balance").to_stdout
    end

  end

end
