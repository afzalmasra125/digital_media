class Movie < ApplicationRecord
  has_many :images
  belongs_to :users through: :watchlists
 # has_many :watchlists through: :users
end
