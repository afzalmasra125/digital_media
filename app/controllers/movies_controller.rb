class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: movies.as_json
    end
  def create
    movie = Movie.new( {
                        name: params[:name],
                        summary: params[:summary],
                        actor: params[:actor],
                        rating: params[:rating],
                        genre: params[:genre],
                        content_url: params[:content_url]
                       })
    movie.save
    render json: movie.as_json
  end 
  def show
    movies = Movie.find(params[:id])
    render json: movies.as_json
  end
  def update
    movie = Movie.find(params[:id])
    movie.name = params[:name] || movie.name
    movie.summary = params[:summary] || movie.summary
    movie.actor = params[:actor] || movie.actor
    movie.rating = params[:rating] || movie.rating
    movie.genre = params[:genre] || movie.genre
    movie.content_url = params[:content_url] || movie.content_url
    movie.save
    render json: movie.as_json
 end 
 def destroy
   movie = Movie.find(params[:id])
   movie.destroy    
   render json: {message: "Successfully destroyed movie ##{movie.id}"}
 end
end   

