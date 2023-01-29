json.extract! transaction, :id, :dollar_price, :pokemon_id, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
