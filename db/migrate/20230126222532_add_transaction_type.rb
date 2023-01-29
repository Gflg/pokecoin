class AddTransactionType < ActiveRecord::Migration[7.0]
  def change
    add_column :account_transactions, :transaction_type, :string
  end
end
