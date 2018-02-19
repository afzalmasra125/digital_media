Rails.application.routes.draw do
   get '/movies' => 'movies#index'
   post '/movies' => 'movies#create'
   get '/movies/:id' => 'movies#show'
   patch '/movies/:id' => 'movies#update'
   delete '/movies/:id' => 'movies#destroy'

   get '/images' => 'images#index'
   post '/images' => 'images#create'
   get '/images/:id' => 'images#show'
   patch '/images/:id' => 'images#update'
   delete '/images/:id' => 'images#destroy'

end


