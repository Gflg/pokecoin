class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show ]

  # GET /accounts or /accounts.json
  def index
    @accounts = AccountFinder.new.call
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @current_bitcoin_to_dollar_price = BitcoinToDollarService.new.get_bitcoin_value_in_dollars
    @account_pokemons = @account.pokemon_not_sold_in_wallet
    @earns_in_account = CalculateEarnsService.new(@account, @current_bitcoin_to_dollar_price).call
  end

  # GET /accounts/new
  def new
    @account = AccountCreator.new.call
  end

  # POST /accounts or /accounts.json
  def create
    @account = AccountCreator.new(account_params).call

    respond_to do |format|
      if @account.save
        format.html { redirect_to account_url(@account), notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = AccountFinder.new(id: params[:id]).call
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:username)
    end
end
