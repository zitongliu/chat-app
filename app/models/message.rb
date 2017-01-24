class Message < ApplicationRecord
  belongs_to :chatroom, optional: true
  after_create_commit { BroadcastMessageJob.perform_later self}
end
