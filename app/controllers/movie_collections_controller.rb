class MovieCollectionsController < ApplicationController

  def index
  @movies = Unirest.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV["MOVIEDB_API_KEY"]}&language=en-US&page=1").body["results"]
  render json: @movies.as_json
  end
  def show
       @movie = Unirest.get("https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV["MOVIEDB_API_KEY"]}&language=en-US&append_to_response=#{ENV["MOVIEDB_API_KEY"]}").body

       puts "https://api.themoviedb.org/3/movie/#{params[:id]}?api_key=#{ENV["MOVIEDB_API_KEY"]}&language=en-US&append_to_response=#{ENV["MOVIEDB_API_KEY"]}"
       render json: @movie.as_json
  end
end 
