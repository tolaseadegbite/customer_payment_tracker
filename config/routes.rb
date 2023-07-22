Rails.application.routes.draw do
  root "customers#index"
  devise_for :users
  
  resources :customers do
    resources :product_item_dates, except: [:index, :show] do
      resources :product_items, except: [:index, :show]
    end
  end
end
