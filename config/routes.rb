Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end

      get '/owners', to: 'owners#index'
      post '/owners', to: 'owners#create'
      patch '/owners', to: 'owners#update'
      get '/vets', to: 'vets#index'
      get '/pets', to: 'pets#index'
    end
  end
end
