
$( document ).ready(function(){

  // Get user id from div
  var userID  = $("#hidden").html();
  console.log("The user ID is: ", userID);



  $messages = $('#messages');
  var chatroomID = $messages.data('chatroom-id');


  App.chatrooms = App.cable.subscriptions.create({
      channel: "ChatroomsChannel", // Describes which channel it corresponds to
      chatroom_id: chatroomID

      // team: "RANDOM" // Anything else will be in params
    }, {
    connected: function () {
      console.log("Connected to the ChatroomsChannel");
    },
    disconnected: function () {},
    received: function (data) {
      $('#messages').append( data.message );
    },
    speak: function ( message ) {
      console.log( chatroomID );
      this.perform( 'speak', {
        message: message,
        chatroom_id: chatroomID,
        user_id: userID
      });
    }
  });

  $(document).on('keypress', '.socket-input', function (event) {
    if (event.keyCode === 13) {
      App.chatrooms.speak( event.target.value );
      event.target.value = '';
      event.preventDefault();
    }
  });









});
