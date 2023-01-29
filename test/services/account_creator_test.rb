require "test_helper"

class AccountCreatorTest < ActionDispatch::SystemTestCase
    test "create account" do
        account_params = {
            id: 3,
            username: "a username"
        }
        account = AccountCreator.new(account_params).call

        assert account.id == account_params[:id]
        assert account.username == account_params[:username]
    end
end