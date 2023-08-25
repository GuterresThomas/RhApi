Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees, only: [:index, :create, :show, :update, :destroy]
  resources :bulletin_boards, only: [:index, :create, :show, :update, :destroy]
  resources :cash_register, only: [:index, :create, :show, :update, :destroy]
  resources :customer, only: [:index, :create, :show, :update, :destroy]
  resources :payment, only: [:index, :create, :show, :update, :destroy]
  resources :product_category, only: [:index, :create, :show, :update, :destroy]
  resources :product, only: [:index, :create, :show, :update, :destroy]
  resources :sale_item, only: [:index, :create, :show, :update, :destroy]
  resources :sale, only: [:index, :create, :show, :update, :destroy]
  resources :sale_report, only: [:index, :create, :show, :update, :destroy]
  resources :transaction_history, only: [:index, :create, :show, :update, :destroy]
  
  # Defines the root path route ("/")
  # root "articles#index"
end
