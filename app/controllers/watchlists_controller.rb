class WatchlistsController < ApplicationController
  def create
    wathclist = WatchList.new
                    (
                      user_id: current_user.id,
                      movie_id: params[:movie_id]  
                      )
  @carted_product.save
  render json: watchlist.as_json
end
