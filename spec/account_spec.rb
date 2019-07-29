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

end
