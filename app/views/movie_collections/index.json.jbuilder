   json.array!@movies.each do |movie|
  json.id movie.id
  json.name movie.title
  json.summary movie.overview
  json.image movie.poster_path
end 
