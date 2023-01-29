require "test_helper"

class PokemonInWalletFinderTest < ActionDispatch::SystemTestCase
    test "find pokemon in wallet" do
        @pokemon_in_wallet = pokemon_in_wallets(:pokemon_in_wallet_one)
        pokemon_in_wallet = PokemonInWalletFinder.new(pokemon_in_wallet_id: @pokemon_in_wallet.id).call

        assert pokemon_in_wallet.id == @pokemon_in_wallet.id
        assert pokemon_in_wallet.pokemon_id == @pokemon_in_wallet.pokemon_id
        assert pokemon_in_wallet.account_id == @pokemon_in_wallet.account_id
        assert pokemon_in_wallet.is_sold == @pokemon_in_wallet.is_sold
    end
end