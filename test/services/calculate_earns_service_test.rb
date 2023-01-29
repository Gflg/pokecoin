require "test_helper"

class CalculateEarnsServiceTest < ActionDispatch::SystemTestCase
    setup do
        @current_bitcoin_to_dollar_price = BitcoinToDollarService.new.get_bitcoin_value_in_dollars
        @account = accounts(:account_one)
    end

    test "calculate earns" do
        earns = CalculateEarnsService.new(@account, @current_bitcoin_to_dollar_price).call
        assert defined? earns, true
    end
end