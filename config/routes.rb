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
      get '/merchants/most_revenue', to: 'merchants_revenue#index'
      get '/merchants/revenue',      to: 'merchants_revenue#show'
      get '/merchants/most_items',   to: 'merchants_most_items#index'

      get '/transactions/find_all',  to: 'transactions_find#index'
      get '/transactions/find',      to: 'transactions_find#show'
      get '/transactions/random',    to: 'transactions_random#show'

      resources :merchants, only: [:index, :show], defaults: {format: :json} do
        get '/items',                           to: 'merchants/items#index'
        get '/invoices',                        to: 'merchants/invoices#index'
        get '/favorite_customer',               to: 'merchants/favorite_customer#show'
        get '/revenue',                         to: 'merchants/revenue#show'
        get '/customers_with_pending_invoices', to: 'merchants/customers_with_pending_invoices#index'
      end

      resources :invoices, only: [:index, :show], defaults: {format: :json} do
        get '/transactions',  to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items',         to: 'invoices/items#index'
        get '/customer',      to: 'invoices/customer#show'
        get '/merchant',      to: 'invoices/merchant#show'
      end

      resources :invoice_items, only: [:index, :show], defaults: {format: :json} do
        get '/invoice', to: 'invoice_items/invoice#show'
        get '/item',    to: 'invoice_items/item#show'
      end

      resources :items, only: [:index, :show], defaults: {format: :json} do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant',      to: 'items/merchant#show'
      end

      resources :transactions, only: [:index, :show], defaults: {format: :json} do
        get '/invoice', to: 'transactions/invoice#show'
      end

      resources :customers, only: [:index, :show], defaults: {format: :json} do
        get '/invoices',          to: 'customers/invoices#index'
        get '/transactions',      to: 'customers/transactions#index'
        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
      end
    end
  end

end
