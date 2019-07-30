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
      "#{transaction[:date]} || || #{'%.2f' % transaction[:amount]} || #{'%.2f' % transaction[:new_balance]} \n "
    elsif transaction[:type] == :deposit
      "#{transaction[:date]} || #{'%.2f' % transaction[:amount]} || || #{'%.2f' % transaction[:new_balance]} \n "
    end
  end

  def print_formatted_records(record)
    print record.reverse.map { |transaction| format(transaction) }.join
  end
end
