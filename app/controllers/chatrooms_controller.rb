class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    @messages = Message.all


  end
  def show
    @chatroom = Chatroom.find_by( :id => params[:id] )
    @messages = Message.all
    @message = Message.new
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    @chatroom.user_id = session[:user_id]
    @chatroom.team_id = session[:team_id]
    # binding.pry
    if @chatroom.save
      redirect_to chatrooms_path
    else
      redirect_to new_chatroom_path
    end
  end

  def destroy
    chatroom = Chatroom.find_by :id => params[:id]
    chatroom.destroy

    redirect_to chatrooms_path()

  end

  private
    def chatroom_params
      params.require(:chatroom).permit(:name)
    end

end
