class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.numeric :base_experience
      t.decimal :btc_price
      t.text :image_url

      t.timestamps
    end
  end
end
