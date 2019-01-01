Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end
      post '/users', to: 'users#create'
      post '/login', to: 'sessions#create'
      get '/owners', to: 'owners#index'
      post '/owners', to: 'owners#create'
      patch '/owners', to: 'owners#update'
      post '/vets', to: 'vets#create'
      get '/vets', to: 'vets#index'
      patch 'vets', to: 'vets#update'
      post '/pets', to: 'pets#create'
      get '/pets', to: 'pets#index'
      patch '/pets', to: 'pets#update'
      post '/reservations', to: 'reservations#create'
      patch '/reservations', to: 'reservations#update'
      get '/logs', to: 'logs#index'
    end
  end
end
