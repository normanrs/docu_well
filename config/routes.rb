Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   '/appointments', to: 'appointments#create'
      get    '/appointments', to: 'appointments#index'
      delete '/appointments', to: 'appointments#delete'

      post   '/profiles', to: 'profiles#create'
      get    '/profiles', to: 'profiles#index'
      delete '/profiles', to: 'profiles#delete'

      post   '/providers', to: 'providers#create'
      get    '/providers', to: 'providers#index'

      post   '/users',   to: 'user#create'
      get    '/users',   to: 'user#show'

      post   '/insurances', to: 'insurances#create'
    end
  end
end
