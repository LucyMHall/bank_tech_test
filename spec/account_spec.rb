require 'account'

RSpec.describe Account do

  before (:each) do
  end

  describe "#initialize" do
    it "contains a instance of the balance class" do
      @account = Account.new
      expect(@account.balance).to be_an_instance_of(Balance)
    end
    it "contains an empty record array" do
      @account = Account.new
      expect(@account.record).to eq([])
    end
  end

  describe "#deposit" do

    it "calls the deposit method on balance" do
      @account = Account.new
      @account.deposit(10.00, "10-01-2012")
      expect(@account.balance.current_balance).to eq(10.00)
    end

    it "creates a record of the transaction" do
      @account = Account.new
      expected_record = {:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00}
      expect(@account.deposit(10.00, "10-01-2012")).to eq(expected_record)
    end
  end

  describe "#withdraw" do
    it "runs withdraw method on balance and stores a record" do
      @account = Account.new
      expected_record = {:type => :withdraw, :amount => 10.00, :date => "10-01-2012", :new_balance => -10.00}
      expect(@account.withdraw(10.00, "10-01-2012")).to eq(expected_record)
    end
  end

end
