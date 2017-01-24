class Message < ApplicationRecord
  belongs_to :chatroom, optional: true
end
