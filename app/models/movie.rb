class Movie < ApplicationRecord
  has_many :images
  has_many :watchlists
  has_many :users, through: :watchlists
end
