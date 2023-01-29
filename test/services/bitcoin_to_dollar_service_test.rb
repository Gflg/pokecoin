require "test_helper"

class BitcoinToDollarServiceTest < ActionDispatch::SystemTestCase
    test "get dollar value from API" do
        dollar = BitcoinToDollarService.new.get_bitcoin_value_in_dollars
        assert defined? dollar, true
    end
end