Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :reservations do
        get '/current', to: 'current#index'
      end
    end
  end
end
