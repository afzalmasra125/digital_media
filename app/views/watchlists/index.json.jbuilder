json.array! @movies.watchlist.each do|watchlist|
  json.id watchlist.id
  json.name watchlist.name
  json.summary watchlist.summary
  json.actor watchlist.actor
  json.rating watchlist.rating
  json.genre watchlist.genre
  json.content_url watchlist.content_url
end 
  json.images movie.images.each do|image|
    json.image_url image.image_url
  end