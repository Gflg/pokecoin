require "test_helper"

class AccountFinderTest < ActionDispatch::SystemTestCase
    test "find all accounts" do
        accounts = AccountFinder.new.call

        #There are 2 accounts in accounts.yml
        assert accounts.count == 2
    end

    test "find account by id" do
        @account = accounts(:account_one)
        account = AccountFinder.new(id: @account.id).call

        assert account.id == @account.id
        assert account.username == @account.username
    end
end