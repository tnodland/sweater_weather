Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/antipode', to: 'antipode#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
      delete '/favorites', to: 'favorites#destroy'
      get '/favorites', to: 'favorites#index'
    end
  end
end
