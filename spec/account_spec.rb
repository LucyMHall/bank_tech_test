require 'account'

RSpec.describe Account do

  before (:each) do
  end

  describe "#initialize" do
    it "contains a instance of the balance class" do
      @account = Account.new
      expect(@account.balance).to be_an_instance_of(Balance)
    end
  end

  describe "#deposit" do
    it "runs deposit method on balance and stores a record" do
      @account = Account.new
      expected_record = {:type => :deposit, :amount => 10.00, :date => "10-01-2012", :new_balance => 10.00}
      expect(@account.deposit(10.00, "10-01-2012")).to eq(expected_record)
    end
  end

end
