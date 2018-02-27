class WatchlistsController < ApplicationController
  def create
    watchlist = Watchlist.new({
                      user_id: current_user.id,
                      movie_id: params[:movie_id]  
                      })
    watchlist.save
    p "******"
    p watchlist.errors.full_messages
    render json: watchlist.as_json
  end
end 
