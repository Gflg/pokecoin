class CreatePokemonInWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_in_wallets do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.boolean :is_sold, default: false

      t.timestamps
    end
  end
end
