class MoviesController < ApplicationController
# before_action :authenticate_admin, only: [:create, :update, :destroy]
  def index
    @movies = Movie.all
    
    search_term = params[:search]
    if search_term
        @movies = movies.where("name iLike ?", "%#{search_term}%")
    end
  render 'index.json.jbuilder'

    end
  def create
    movie = Movie.new( {
                        # user_id: current_user.id,
                        name: params[:name],
                        summary: params[:summary],
                        actor: params[:actor],
                        rating: params[:rating],
                        genre: params[:genre],
                        content_url: params[:content_url]
                       })
    if movie.save
      image = Image.new({
                        image_url: params[:image_url],
                         movie_id: movie.id 
        })
        image.save
        render json: movie.as_json
    end
  end 
  def show
    @movie = Movie.find(params[:id])
    render 'show.json.jbuilder'
  end
  def update
    movie = Movie.find(params[:id])
    # user = current_user.id
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
   user = current_user.id
   movie.destroy    
   render json: {message: "Successfully destroyed movie ##{movie.id}"}
 end
end  


