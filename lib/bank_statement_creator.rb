class BankStatementCreator

  def print_bank_statement(record)
    print_header
    print record.map{|transaction| format(transaction)}.join
  end

  private

  def print_header
      print "date || credit || debit || balance \n "
  end

  def format(transaction)
    if transaction[:type] == :withdraw
      "#{transaction[:date]} || || #{transaction[:amount]}0 || #{transaction[:new_balance]}0 \n "
    else
     "#{transaction[:date]} || #{transaction[:amount]}0 || || #{transaction[:new_balance]}0 \n "
    end
  end

end
