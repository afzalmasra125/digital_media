  json.id @movie.id
  json.name @movie.name
  json.summary @movie.summary
  json.actor @movie.actor
  json.rating @movie.rating
  json.genre @movie.genre
  json.content_url @movie.content_url
  json.images @movie.images.each do|image|
    json.image_url image.image_url 
  end