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
   delete '/watchlists/:id' => 'watchlists#destroy'
   
   get '/images' => 'images#index'

   get '/collection' => 'movie_collections#index'
   get '/tvshows' => 'tv_shows#index'

end


