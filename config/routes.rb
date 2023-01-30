Rails.application.routes.draw do
  resources :account_transactions, only: [:index]
  resources :accounts, only: [:index, :show, :new, :create]
  get "sell", to: "account_transactions#sell", as: "sell"
  post "sell", to: "account_transactions#confirm_sell", as: "confirm_sell"
  get "buy", to: "account_transactions#buy", as: "buy"
  post "buy", to: "account_transactions#confirm_buy", as: "confirm_buy"

  root "accounts#index"
end
