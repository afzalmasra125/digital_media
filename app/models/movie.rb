class Movie < ApplicationRecord
  has_many :images
  has_many :users, through: :watchlist
 # has_many :watchlists through: :users
end
