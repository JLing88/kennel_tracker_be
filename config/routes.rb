Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/owners', to: 'owners#create'

      namespace :reservations do
        get '/current', to: 'current#index'
      end
      get 'vets', to: 'vets#index'
    end
  end
end
