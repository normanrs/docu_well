Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   '/appointments', to: 'appointments#create'
      get    '/appointments', to: 'appointments#index'
      delete '/appointments', to: 'appointments#delete'

      post   '/prescriptions', to: 'prescriptions#create'
      get    '/prescriptions', to: 'prescriptions#index'
      delete '/prescriptions', to: 'prescriptions#delete'

      post   '/profiles', to: 'profiles#create'
      get    '/profiles', to: 'profiles#index'
      delete '/profiles', to: 'profiles#delete'
      patch  '/profiles', to: 'profiles#update'

      post   '/providers', to: 'providers#create'
      get    '/providers', to: 'providers#index'

      post   '/users',   to: 'user#create'
      get    '/users',   to: 'user#show'

      post   '/insurances', to: 'insurances#create'
      get    '/insurances', to: 'insurances#index'
      delete '/insurances', to: 'insurances#delete'
    end
  end
end
