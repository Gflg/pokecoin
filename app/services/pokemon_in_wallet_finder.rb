class PokemonInWalletFinder
    def initialize(params)
        @id = params[:pokemon_in_wallet_id]
    end

    def call
        find_pokemon_in_wallet
    end

    private

    def find_pokemon_in_wallet
        PokemonInWallet.find(@id)
    end
end