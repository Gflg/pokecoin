class AccountTransaction < ApplicationRecord
  belongs_to :pokemon_in_wallet
  belongs_to :account
  TRANSACTION_TYPES = ["Buy", "Sell"]
end
