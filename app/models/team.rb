class Team < ApplicationRecord
  has_many :channels
  has_many :users
end
