class WatchlistsController < ApplicationController
    def index
    watchlist = Watchlist.all
    render json: watchlist.as_json
  end
  def create
    watchlist = Watchlist.new({
                      user_id: current_user.id,
                      movie_id: params[:movie_id]  
                      })
    watchlist.save
    render json: watchlist.as_json
  end
end 
