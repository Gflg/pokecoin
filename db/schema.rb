# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_26_222532) do
  create_table "account_transactions", force: :cascade do |t|
    t.decimal "dollar_price"
    t.integer "pokemon_in_wallet_id", null: false
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transaction_type"
    t.index ["account_id"], name: "index_account_transactions_on_account_id"
    t.index ["pokemon_in_wallet_id"], name: "index_account_transactions_on_pokemon_in_wallet_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_in_wallets", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "account_id", null: false
    t.boolean "is_sold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_pokemon_in_wallets_on_account_id"
    t.index ["pokemon_id"], name: "index_pokemon_in_wallets_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.decimal "base_experience"
    t.decimal "btc_price"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_transactions", "accounts"
  add_foreign_key "account_transactions", "pokemon_in_wallets"
  add_foreign_key "pokemon_in_wallets", "accounts"
  add_foreign_key "pokemon_in_wallets", "pokemons"
end
