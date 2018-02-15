Rails.application.routes.draw do
   get '/movies' => 'movies#index'
   post '/movies' => 'movies#create'
   get '/movies/:id' => 'movies#show'
end
