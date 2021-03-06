Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      post '/auth/login', to: 'authentication#login'
      # get '/*a', to: 'application#not_found'
      resources :regions
      resources :products
      resources :orders
    end
  end
end
