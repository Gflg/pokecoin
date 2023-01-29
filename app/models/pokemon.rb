class Pokemon < ApplicationRecord
    has_many :pokemon_in_wallets

    def display_name
        self.name.capitalize
    end

    def current_dollar_price
        current_bitcoin_to_dollar_price = BitcoinToDollarService.new.get_bitcoin_value_in_dollars
        self.btc_price * current_bitcoin_to_dollar_price
    end
end
