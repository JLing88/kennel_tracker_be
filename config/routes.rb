Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end

      get '/owners', to: 'owners#index'
      post '/owners', to: 'owners#create'
      post '/vets', to: 'vets#create'
      get '/vets', to: 'vets#index'
      get '/pets', to: 'pets#index'
    end
  end
end
