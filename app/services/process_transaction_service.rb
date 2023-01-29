class ProcessTransactionService
    def initialize(params)
        @params = params
        @pokemon_in_wallet = params[:pokemon_in_wallet]
    end

    def call
        if is_buy_transaction
            process_buy_transaction
        else
            process_sell_transaction
        end
        @transaction
    end

    private

    def process_buy_transaction
        create_pokemon_in_wallet
        create_transaction
        set_dollar_price_in_transaction
    end

    def process_sell_transaction
        create_transaction
        set_dollar_price_in_transaction
        set_pokemon_as_sold
    end

    def create_pokemon_in_wallet
        @pokemon_in_wallet = PokemonInWalletCreator.new(
            account_id: @params[:account_id],
            pokemon_id: @params[:pokemon_id]
        ).call
    end

    def create_transaction
        @transaction = AccountTransactionCreator.new(
            account_id: @params[:account_id],
            pokemon_in_wallet_id: @pokemon_in_wallet.id,
            transaction_type: @params[:transaction_type]
        ).call
    end

    def set_dollar_price_in_transaction
        @transaction.dollar_price = @pokemon_in_wallet.pokemon.current_dollar_price
    end

    def set_pokemon_as_sold
        @pokemon_in_wallet.sell
    end

    def is_buy_transaction
        @params[:transaction_type] == "Buy"
    end
end