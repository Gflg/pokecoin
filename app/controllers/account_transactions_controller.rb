class AccountTransactionsController < ApplicationController
  before_action :set_account, only: %i[ sell confirm_sell buy confirm_buy ]
  before_action :set_pokemon_in_wallet, only: %i[ sell confirm_sell ]

  # GET /transactions or /transactions.json
  def index
    if params[:account_id].nil?
      @transactions = AccountTransactionFinder.new.call
    else
      @transactions = AccountTransactionFinder.new(account_id: params[:account_id]).call
      @account = AccountFinder.new(id: params[:account_id]).call
    end
  end

  # GET /sell to load a screen with a transaction with account and pokemon in params
  def sell
  end

  # POST /sell to confirm sell of the params received in the previous endpoint
  def confirm_sell
    @transaction = ProcessTransactionService.new(
      account_id: params[:account_id],
      transaction_type: params[:transaction_type],
      pokemon_in_wallet: @pokemon_in_wallet
    ).call

    respond_to do |format|
      if @transaction.save
        @pokemon_in_wallet.save
        format.html { redirect_to account_url(@account), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :sell, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /sell to load a screen with a transaction with account in params
  def buy
  end

  # POST /sell to confirm buy of the params received and a selected pokemon in the previous endpoint
  def confirm_buy
    @transaction = ProcessTransactionService.new(
      account_id: params[:account_id],
      pokemon_id: params[:pokemon_id],
      transaction_type: params[:transaction_type]
    ).call

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_url(@account), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        @pokemon_in_wallet = PokemonInWalletFinder.new(
          pokemon_in_wallet_id: @transaction.pokemon_in_wallet_id
        ).call.destroy
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_account
      @account = AccountFinder.new(id: params[:account_id]).call
    end

    def set_pokemon_in_wallet
      @pokemon_in_wallet = PokemonInWalletFinder.new(pokemon_in_wallet_id: params[:pokemon_id]).call
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.permit(:dollar_price, :pokemon_id, :account_id, :transaction_type, :pokemon_in_wallet_id)
    end
end
