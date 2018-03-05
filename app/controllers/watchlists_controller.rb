class WatchlistsController < ApplicationController
    def index
    @watchlists = Watchlist.all
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
end 
