class ChatroomsController < ApplicationController
  def index
    if session[:user_id] == nil
      redirect_to login_path
    end

    @chatrooms = Chatroom.all
    @messages = Message.all
    @userID = session[:user_id]
    @team = Team.find_by( :id => session[:team_id] )

    session[:team_id] = nil unless @team

    @response = {
    :userID => @userID
  }

  respond_to do |format|
    format.html # This will render generator.html.erb in response to requests for HTML
    # format.json { render json: @response } # This will render JSON in response to AJAX requests
  end


  end
  def show
    if session[:user_id] == nil
      redirect_to login_path
    end
    @userID = session[:user_id]
    @chatroom = Chatroom.find_by( :id => params[:id] )
    @messages = Message.all
    @message = Message.new
    @chatrooms = Chatroom.all
    @team = Team.find_by( :id => session[:team_id] )


    @gradients = [
        ["background: #556270; /* fallback for old browsers */",
          "background: -webkit-linear-gradient(to left, #556270 , #FF6B6B); /* Chrome 10-25, Safari 5.1-6 */",

          "background: linear-gradient(to left, #556270 , #FF6B6B); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
          "
        ],
        ["background: #9D50BB; /* fallback for old browsers */",
          "background: -webkit-linear-gradient(to left, #9D50BB , #6E48AA); /* Chrome 10-25, Safari 5.1-6 */
",

          "background: linear-gradient(to left, #9D50BB , #6E48AA); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */"
        ]
      ]

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
