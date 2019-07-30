# frozen_string_literal: true

class BankStatementCreator
  def print_bank_statement(record)
    print_header
    print_formatted_records(record)
  end

  private

  def print_header
    print "date || credit || debit || balance \n "
  end

  def format(transaction)
    if transaction[:type] == :withdraw
      "#{transaction[:date]} || || #{transaction[:amount]}0 || #{transaction[:new_balance]}0 \n "
    elsif transaction[:type] == :deposit
      "#{transaction[:date]} || #{transaction[:amount]}0 || || #{transaction[:new_balance]}0 \n "
    end
  end

  def print_formatted_records(record)
    print record.map { |transaction| format(transaction) }.join
  end
end
