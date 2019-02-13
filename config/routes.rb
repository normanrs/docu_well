Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get '/profile', to: 'profile#index'
      
    end
  end
end
