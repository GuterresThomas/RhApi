Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :employees, only: [:index, :create, :show, :update, :destroy]
  resources :bulletin_boards, only: [:index, :create, :show, :update, :destroy]
  resources :cash_registers, only: [:index, :create, :show, :update, :destroy]
  resources :customers, only: [:index, :create, :show, :update, :destroy]
  resources :payments, only: [:index, :create, :show, :update, :destroy]
  resources :products_categories, only: [:index, :create, :show, :update, :destroy]
  resources :products, only: [:index, :create, :show, :update, :destroy]
  resources :sale_items, only: [:index, :create, :show, :update, :destroy]
  resources :sales, only: [:index, :create, :show, :update, :destroy]
  resources :sales_reports, only: [:index, :create, :show, :update, :destroy]
  resources :transaction_histories, only: [:index, :create, :show, :update, :destroy]
  
  # Defines the root path route ("/")
  # root "articles#index"
end
