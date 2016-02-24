Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      get '/customers/find_all',     to: 'customers_find#index'
      get '/customers/find',         to: 'customers_find#show'
      get '/customers/random',       to: 'customers_random#show'

      get '/invoice_items/find_all', to: 'invoice_items_find#index'
      get '/invoice_items/find',     to: 'invoice_items_find#show'
      get '/invoice_items/random',   to: 'invoice_items_random#show'

      get '/invoices/find_all',      to: 'invoices_find#index'
      get '/invoices/find',          to: 'invoices_find#show'
      get '/invoices/random',        to: 'invoices_random#show'

      get '/items/find_all',         to: 'items_find#index'
      get '/items/find',             to: 'items_find#show'
      get '/items/random',           to: 'items_random#show'

      get '/merchants/find_all',     to: 'merchants_find#index'
      get '/merchants/find',         to: 'merchants_find#show'
      get '/merchants/random',       to: 'merchants_random#show'
      get '/merchants/:id/items',    to: 'merchants_relationship#index'

      get '/transactions/find_all',  to: 'transactions_find#index'
      get '/transactions/find',      to: 'transactions_find#show'
      get '/transactions/random',    to: 'transactions_random#show'

      resources :merchants, only: [:index, :show], defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :transactions, only: [:index, :show], defaults: {format: :json}
      resources :customers, only: [:index, :show], defaults: {format: :json}
    end
  end

end
