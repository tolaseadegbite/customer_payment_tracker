Rails.application.routes.draw do
  root "customers#index"
  devise_for :users

  # get 'search', to: "customers#search"

  get '/search', to: 'search#index'
  
  resources :customers do
    resources :product_item_dates, except: [:index, :show] do
      resources :product_items, except: [:index, :show]
    end
  end

end
