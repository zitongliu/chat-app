class Chatroom < ApplicationRecord
  belongs_to :admin, :class_name => User, :foreign_key => :user_id
  has_and_belongs_to_many :users # Think of these as members
end
