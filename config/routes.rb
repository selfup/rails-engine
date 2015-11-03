Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, defaults: { format: 'json' } do
        collection do
          get "find"
          get "find_all"
        end
      end

      resources :transactions, defaults: { format: 'json' }

      resources :items, defaults: { format: 'json' }

      resources :merchants, defaults: { format: 'json' } do
        collection do
          get "find"
          get "find_all"
        end
      end

      resources :invoices, defaults: { format: 'json' }

      resources :invoice_items, defaults: { format: 'json' }

    end
  end
end
