require "test_helper"

class AccountTransactionCreatorTest < ActionDispatch::SystemTestCase
    setup do
        @account = accounts(:account_one)
    end

    test "create account transaction" do
        pokemon_in_wallet_params = {
            id: 5,
            pokemon_id: 2,
            account_id: 1
        }
        pokemon_in_wallet = PokemonInWalletCreator.new(pokemon_in_wallet_params).call

        account_params = {
            id: 10,
            account_id: @account.id,
            pokemon_in_wallet_id: pokemon_in_wallet.id,
            transaction_type: "Buy"
        }
        transaction = AccountTransactionCreator.new(account_params).call

        assert pokemon_in_wallet.id == pokemon_in_wallet_params[:id]
        assert pokemon_in_wallet.pokemon_id == pokemon_in_wallet_params[:pokemon_id]
        assert pokemon_in_wallet.account_id == pokemon_in_wallet_params[:account_id]
        pokemon_in_wallet.destroy
    end
end