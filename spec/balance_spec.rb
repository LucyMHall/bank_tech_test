require 'balance'

RSpec.describe Balance do

  before (:each) do
    @balance = Balance.new
  end

  it 'initializes at 0.00' do
    expect(@balance.current_balance).to eq(0.00)
  end

end
