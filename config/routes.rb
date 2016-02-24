Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/customers/find_all',     to: 'customers_find#index'
      get '/customers/find',         to: 'customers_find#show'

      get '/invoice_items/find_all', to: 'invoice_items_find#index'
      get '/invoice_items/find',     to: 'invoice_items_find#show'

      get '/invoices/find_all',      to: 'invoices_find#index'
      get '/invoices/find',          to: 'invoices_find#show'

      get '/items/find_all',         to: 'items_find#index'
      get '/items/find',             to: 'items_find#show'

      get '/merchants/find_all',     to: 'merchants_find#index'
      get '/merchants/find',         to: 'merchants_find#show'

      get '/transactions/find_all',  to: 'transactions_find#index'
      get '/transactions/find',      to: 'transactions_find#show'

      resources :merchants, only: [:index, :show], defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :transactions, only: [:index, :show], defaults: {format: :json}
      resources :customers, only: [:index, :show], defaults: {format: :json}
    end
  end

end
