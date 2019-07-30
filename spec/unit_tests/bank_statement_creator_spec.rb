# frozen_string_literal: true

require 'bank_statement_creator'

RSpec.describe BankStatementCreator do
  before(:each) do
    @bank_statement_creator = BankStatementCreator.new
    @formatted_header_string = "date || credit || debit || balance \n "
  end

  describe '#print_bank_statement' do
    it 'displays an empty table if it is passed an empty record' do
      record = []
      expect { @bank_statement_creator.print_bank_statement(record) }.to output(@formatted_header_string).to_stdout
    end

    it 'displays withdrawal amount in the debit column' do
      withdrawal_record = [
        { type: :withdraw,
          amount: 10.00,
          date: '10-01-2012',
          new_balance: -10.00 }
        ]
      formatted_withdrawal_string = "10-01-2012 || || 10.00 || -10.00 \n "
      expected_display = @formatted_header_string + formatted_withdrawal_string
      expect { @bank_statement_creator.print_bank_statement(withdrawal_record) }.to output(expected_display).to_stdout
    end

    it 'displays deposit amount in credit column' do
      deposit_record = [
        { type: :deposit,
          amount: 10.00,
          date: '10-01-2012',
          new_balance: 10.00 }
        ]
      formatted_deposit_string = "10-01-2012 || 10.00 || || 10.00 \n "
      expected_display = @formatted_header_string + formatted_deposit_string
      expect { @bank_statement_creator.print_bank_statement(deposit_record) }.to output(expected_display).to_stdout
    end

    it 'displays records newest first when given more than 1 transaction' do
      deposit_and_withdraw_record = [
        { type: :deposit,
          amount: 10.00,
          date: '10-01-2012',
          new_balance: 10.00 },
        { type: :withdraw,
          amount: 10.00,
          date: '11-01-2012',
          new_balance: 0.00 }
      ]
      formatted_deposit_string = "10-01-2012 || 10.00 || || 10.00 \n "
      formatted_withdrawal_string = "11-01-2012 || || 10.00 || 0.00 \n "
      expected_display = @formatted_header_string +  formatted_withdrawal_string + formatted_deposit_string
      expect { @bank_statement_creator.print_bank_statement(deposit_and_withdraw_record) }.to output(expected_display).to_stdout
    end
  end
end
