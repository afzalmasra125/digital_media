class WatchlistsController < ApplicationController
  def create
    wathclist = WatchList.new
                    (
                      user_id: current_user.id,
                      movie_id: params[:movie_id]  
                      )
  watctlist.save
  render json: watchlist.as_json
end
