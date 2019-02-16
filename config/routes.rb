Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post   '/profiles', to: 'profiles#create'
      get    '/profiles', to: 'profiles#index'
      delete '/profile', to: 'profiles#delete'
      post   '/users',   to: 'users#create'
      get    '/users',   to: 'users#show'
    end
  end
end
