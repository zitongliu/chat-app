class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    channel = "chatrooms_#{params[:chatroom_id]}_channel"
    stream_from channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'], chatroom_id: data['chatroom_id']
  end
end
