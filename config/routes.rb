Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end

      get '/owners', to: 'owners#index'
      post '/owners', to: 'owners#create'
      get '/vets', to: 'vets#index'
    end
  end
end
