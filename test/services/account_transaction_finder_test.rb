require "test_helper"

class AccountTransactionFinderTest < ActionDispatch::SystemTestCase
    test "find all account transactions" do
        account_transactions = AccountTransactionFinder.new.call

        #There are 4 account transactions in account_transactions.yml
        assert account_transactions.count == 4
    end

    test "find account transaction by account id" do
        @account = accounts(:account_one)
        account_transactions = AccountTransactionFinder.new(account_id: @account.id).call

        #There is 1 account transaction for account 1 in account_transactions.yml
        assert account_transactions.count == 1
    end
end