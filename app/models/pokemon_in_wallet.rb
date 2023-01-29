class PokemonInWallet < ApplicationRecord
  belongs_to :pokemon
  belongs_to :account
  has_one :account_transaction

  def get_paid_price_in_dollars(account_id)
    transaction = AccountTransaction.find_by(
      account_id: account_id,
      pokemon_in_wallet_id: self.id,
      transaction_type: "Buy"
    )
    transaction.dollar_price
  end

  def sell
    self.is_sold = true
  end
end
