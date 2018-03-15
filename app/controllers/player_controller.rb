class PlayerController < ApplicationController
  def index
    @player = Unirest.get("www.youtube.com?key=AIzaSyD8uuErbP9FT1a9gtiSBu66VackPmZNyek").body
    render json: @player
end
end

