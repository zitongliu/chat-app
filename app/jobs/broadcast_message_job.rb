class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message, chatroom_id)
    channel = "chatrooms_#{chatroom_id}_channel"
    ActionCable.server.broadcast channel, message: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    end

end
