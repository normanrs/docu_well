Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/profile', to: 'profile#index'
      delete '/profile', to: 'profile#delete'
      post '/users', to: 'user#create'
      get  '/users', to: 'user#show'
    end
  end
end
