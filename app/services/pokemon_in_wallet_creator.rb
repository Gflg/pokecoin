class PokemonInWalletCreator
    def initialize(params)
        @params = params
    end

    def call
        create_pokemon_in_wallet
    end

    private

    def create_pokemon_in_wallet
        PokemonInWallet.create!(@params)
    end
end