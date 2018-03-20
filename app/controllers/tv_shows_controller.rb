class TvShowsController < ApplicationController
def index
    @tvshows = Unirest.get("https://api.themoviedb.org/3/tv/popular?api_key=#{ENV["MOVIEDB_API_Key"]}&language=en-US&page=3").body["results"]
    render json: @tvshows.as_json
  end
end 
 