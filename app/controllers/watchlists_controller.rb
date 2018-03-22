class WatchlistsController < ApplicationController
   def index
     @movies = current_user.movies
     # @movies = User.find(3).movies
     render 'index.json.jbuilder'
  end
  def create
    watchlist = Watchlist.new({
                      user_id: current_user.id,
                      movie_id: params[:movie_id]  
                      })
    watchlist.save
    render json: watchlist.as_json
  end
  def destroy
   watchlist = Watchlist.find_by(movie_id: params[:id])
   # user = current_user.id
   watchlist.destroy    
   render json: {message: "Successfully destroyed movie ##{movie.id}"}
 end
end 
