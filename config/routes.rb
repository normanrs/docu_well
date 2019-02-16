Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/users', to: 'user#create'
      get  '/users', to: 'user#show'
      get '/profile', to: 'profile#index'
      post '/profile', to: 'profile#create'
    end
  end
end
