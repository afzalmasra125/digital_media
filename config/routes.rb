Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
   get '/movies' => 'movies#index'
   post '/movies' => 'movies#create'
   get '/movies/:id' => 'movies#show'
   patch '/movies/:id' => 'movies#update'
   delete '/movies/:id' => 'movies#destroy'

   post '/users' => 'users#create'

   get '/watchlists' => 'watchlists#index'
   post '/watchlists' => 'watchlists#create'
   
   get '/images' => 'images#index'
end


