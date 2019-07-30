
# Bank Tech Test:

## Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria
Given a client:  
... makes a deposit of 1000 on 10-01-2012  
... makes a deposit of 2000 on 13-01-2012  
... makes a withdrawal of 500 on 14-01-2012  
... prints her bank statement  

Then she would see:
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## Breaking down requirements (changing balance, storing changes, displaying changes)
- a balance needs to exist [DONE]
- a balance is initialised at zero [DONE]
- deposits need to have an amount(to 2dp) and date attached to them [DONE]
- withdrawals need to have an amount(to 2dp) and date attached to them [DONE]
- a deposit increases the balance [DONE]
- a withdrawal decreases the balance [DONE]
- a record is kept of all deposits, withdrawals, the date they happen and the effect on the balance [DONE]
- the record is displayed, with newest actions printed first [DONE]

## Classes and Their Functionality (public)
- **Balance**:
  - #withdraw(minus amount from balance),
  - #deposit(add amount to balance),
  - #current_balance(displays current balance)
- **Account**:
  - #deposit(calls #deposit method on balance, calls #created_record, calls #store_record),
  - #withdraw(calls #withdraw method on balance, calls #created_record, calls #store_record),
  - #print_statement(calls #print_bank_statement on bank_statement_creator)
- **Bank_Statement**:
  - #print_bank_statement(calls #print_header and #print_formatted_records)

## Running Tests:
- run `$ bundle install`
- run `rspec` to get test coverage and status of all tests
- run `rubocop lib` to see the code quality of the app

## Running the App:
- Setting up the environment in irb:
  - `$ irb`
  - `$ require './lib/bank_statement_creator.rb' `
  - `$ require './lib/account.rb'`
  - `$ require './lib/balance.rb'`
    - NOTE: you should get `=> true` if this file has been successfully required
- Functionality:
  -
## Design decisions

### Single Responsibility (Withdrawals and Deposits)
- Withdrawals and deposits will exist as methods on the balance object rather than as different classes
- A balance object will still have very simple functionality e.g. it will know how much it is and can respond to methods which change this
- Withdrawals and deposits resemble methods/ actions in real life more than they do object, keeping them as methods should allow for more easily understandable code

### Reusable code V Clarity (Withdrawal and Deposits)
- Withdrawals and deposits are both very similar - they consist of an amount and a date and they act on the balance
- They could be organised as the method action which takes the argument w or d which would then impact whether the amount is added or subtracted to the balance
  - this would be useful as it would mean more actions could be implemented easily that effect the balance in a different way
  - however, it is unlikely that many more methods would need to be made and it would make the code initially harder to understand, and more withdrawn from what was actually happening with the user (a user chooses between two distinct options normally)
  - this decision will be under review, but for a MVP it is likely they will be kept separate

### Space Taken Storing Changing Balance V Time Taken Recalculating/Accuracy
- The changes to the balance from withdrawals and deposits will take place at the time these actions happen rather than when the statement is asked for
- Although this will mean storing data over time(in the Account class) rather than when required, changes need to happen to the balance independently from whether they need to be displayed - not only because this most accurately represents what happens in real life but that it will allow other potential future features such as not allowing the withdrawal of money if it would drop the balance below zero, or being able to see only the current balance without the detail to be implemented more easily.
