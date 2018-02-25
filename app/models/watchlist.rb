class Watchlist < ApplicationRecord
  belongs to :user
  belongs to :movies
end
