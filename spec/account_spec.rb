require 'account'

RSpec.describe Account do

  before (:each) do
    @account = Account.new
    @deposit_ten_record = {:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00}
    @withdraw_ten_record = {:type => :withdraw, :amount => 10.00, :date => "10-01-2012", :new_balance => -10.00}
  end

  describe "#initialize" do
    it "contains a instance of the balance class" do
      expect(@account.balance).to be_an_instance_of(Balance)
    end
    it "contains an empty record array" do
      expect(@account.record).to eq([])
    end
  end

  describe "#deposit" do

    it "calls the deposit method on balance" do
      @account.deposit(10.00, "10-01-2012")
      expect(@account.balance.current_balance).to eq(10.00)
    end

    it "stores a record of the transaction in the account's record property" do
      @account.deposit(10.00, "10-01-2012")
      expect(@account.record).to include(@deposit_ten_record)
    end
  end

  describe "#withdraw" do

    it "calls the deposit method on balance" do
      @account.withdraw(10.00, "10-01-2012")
      expect(@account.balance.current_balance).to eq(-10.00)
    end

    it "stores a record of the transaction in the account's record property" do
      @account.withdraw(10.00, "10-01-2012")
      expect(@account.record).to include(@withdraw_ten_record)
    end

  end

  describe "#record" do

    it "can store multiple records" do
      @account.withdraw(10.00, "10-01-2012")
      @account.deposit(10.00, "10-01-2012")
      expect(@account.record.length).to eq(2)
    end

  end

end
