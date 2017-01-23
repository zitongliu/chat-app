class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all

  end
  def show
    @chatroom = Chatroom.find_by( :id => params[:id] )
    @messages = Message.all
    @message = Message.new

  end

end
