require "test_helper"

class AccountTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_transactions_url
    assert_response :success
  end

  test "should get buy" do
    get buy_url(account_id: 1)
    assert_response :success
  end

  test "should get sell" do
    get sell_url(account_id: 1, pokemon_id: 1)
    assert_response :success
  end

  test "should create buy transaction" do
    assert_difference("AccountTransaction.count") do
      post confirm_buy_url, params: { account_id: 1, pokemon_id: 1, transaction_type: "Buy" }
    end

    pokemon_in_wallet = PokemonInWalletFinder.new(
      pokemon_in_wallet_id: AccountTransaction.last.pokemon_in_wallet_id
    ).call

    assert pokemon_in_wallet.is_sold != true

    assert_redirected_to account_url(Account.find(1))
  end

  test "should create sell transaction" do
    assert_difference("AccountTransaction.count") do
      post confirm_sell_url, params: { account_id: 1, pokemon_id: 1, transaction_type: "Sell" }
    end

    pokemon_in_wallet = PokemonInWalletFinder.new(
      pokemon_in_wallet_id: AccountTransaction.last.pokemon_in_wallet_id
    ).call

    assert pokemon_in_wallet.is_sold == true

    assert_redirected_to account_url(Account.find(1))
  end
end
