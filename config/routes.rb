Rails.application.routes.draw do
   get '/movies' => 'movies#index'
   post '/movies' => 'movies#create'
   get '/movies/:id' => 'movies#show'
   patch '/movies/:id' => 'movies#update'
   delete '/movies/:id' => 'movies#destroy'

    post '/user_token' => 'user_token#create'
    post '/users' => 'users#create'
end


