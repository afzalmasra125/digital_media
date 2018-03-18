class MovieCollectionsController < ApplicationController

  def index
  @movies = Unirest.get("https://api.themoviedb.org/3/movie/popular?api_key=f3988532ba51714a3223909412981f93&language=en-US&page=1").body["results"]
  render json: @movies.as_json
end
end 
