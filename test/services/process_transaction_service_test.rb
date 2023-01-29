require "test_helper"

class ProcessTransactionServiceTest < ActionDispatch::SystemTestCase
    setup do
        @account = accounts(:account_one)
    end
    
    test "create buy transaction" do
        @pokemon = pokemons(:pokemon_two)
        @transaction = ProcessTransactionService.new(
            account_id: @account.id,
            pokemon_id: @pokemon.id,
            transaction_type: "Buy"
        ).call

        assert defined? @transaction.id, true
        assert @transaction.account_id == @account.id
        assert defined? @transaction.pokemon_in_wallet_id, true
        assert @transaction.transaction_type == "Buy"

        pokemon_in_wallet = PokemonInWalletFinder.new(
            pokemon_in_wallet_id: @transaction.pokemon_in_wallet_id
        ).call

        assert pokemon_in_wallet.account_id == @account.id
        assert pokemon_in_wallet.is_sold != true
    end

    test "create sell transaction" do
        @pokemon_in_wallet = pokemon_in_wallets(:pokemon_in_wallet_one)
        @transaction = ProcessTransactionService.new(
            account_id: @account.id,
            pokemon_in_wallet: @pokemon_in_wallet,
            transaction_type: "Sell"
        ).call

        assert defined? @transaction.id, true
        assert @transaction.account_id == @account.id
        assert @transaction.pokemon_in_wallet_id == @pokemon_in_wallet.id
        assert @transaction.transaction_type == "Sell"
        assert @pokemon_in_wallet.is_sold == true
    end
end
