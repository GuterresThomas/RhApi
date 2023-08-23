Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :employees, only: [:index, :create, :show, :update, :destroy]
  resources :bulletin_boards, only: [:index, :create, :show, :update, :destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
