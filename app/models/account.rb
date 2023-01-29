class Account < ApplicationRecord
    has_many :pokemon_in_wallets
    has_many :account_transactions

    def pokemon_not_sold_in_wallet
        self.pokemon_in_wallets.where(is_sold: false)
    end
end
