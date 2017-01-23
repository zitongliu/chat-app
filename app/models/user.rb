class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :chatrooms
  belongs_to :team
end
