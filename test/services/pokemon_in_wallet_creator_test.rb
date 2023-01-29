require "test_helper"

class PokemonInWalletCreatorTest < ActionDispatch::SystemTestCase
    test "create pokemon in wallet" do
        pokemon_in_wallet_params = {
            id: 4,
            pokemon_id: 2,
            account_id: 1
        }
        pokemon_in_wallet = PokemonInWalletCreator.new(pokemon_in_wallet_params).call

        assert pokemon_in_wallet.id == pokemon_in_wallet_params[:id]
        assert pokemon_in_wallet.pokemon_id == pokemon_in_wallet_params[:pokemon_id]
        assert pokemon_in_wallet.account_id == pokemon_in_wallet_params[:account_id]
        pokemon_in_wallet.destroy
    end
end