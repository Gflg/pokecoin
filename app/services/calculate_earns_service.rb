class CalculateEarnsService
    def initialize(account, current_bitcoin_to_dollar_price)
        @account = account
        @account_pokemons = @account.pokemon_not_sold_in_wallet
        @current_bitcoin_to_dollar_price = current_bitcoin_to_dollar_price
    end

    def call
        calculate_earns
    end

    private

    def calculate_earns
        paid_prices_for_each_pokemon.sum - current_prices_for_each_pokemon.sum
    end

    def paid_prices_for_each_pokemon
        @account_pokemons.map { |pokemon_in_wallet|
            pokemon_in_wallet.get_paid_price_in_dollars(@account.id)
        }
    end

    def current_prices_for_each_pokemon
        @account_pokemons.map { |pokemon_in_wallet|
            @current_bitcoin_to_dollar_price * pokemon_in_wallet.pokemon.btc_price
        }
    end

    def find_account
        Account.find(@params[:id])
    end
end