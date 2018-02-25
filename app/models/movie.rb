class Movie < ApplicationRecord
  has_many :images
  belongs_to :user
end
