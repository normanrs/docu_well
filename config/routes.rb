Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   '/profiles', to: 'profiles#create'
      get    '/profiles', to: 'profiles#index'
      delete '/profiles', to: 'profiles#delete'

      post   '/providers', to: 'providers#create'
      get    '/providers', to: 'providers#index'

      post   '/users',   to: 'user#create'
      get    '/users',   to: 'user#show'
    end
  end
end
