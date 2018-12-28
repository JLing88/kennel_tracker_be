Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end

      get '/owners', to: 'owners#index'
      post '/owners', to: 'owners#create'
      patch '/owners', to: 'owners#update'
      post '/vets', to: 'vets#create'
      get '/vets', to: 'vets#index'
      post '/pets', to: 'pets#create'
      get '/pets', to: 'pets#index'
    end
  end
end
