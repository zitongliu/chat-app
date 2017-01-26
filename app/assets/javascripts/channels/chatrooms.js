
$( document ).ready(function(){
  // var userID = 0;
  //
  // $.ajax({
  //   // The URL for the request
  //   url: "/chatrooms",
  //   // The type of request
  //   type: "GET",
  //   // The type of data we expect back
  //   dataType : "json",
  //   // The data to send (will be converted to a query string and added to the URL)
  // })
  // .done(function(data) {
  //   // Do something with the response
  //   userID = data.userID;
  //   console.log("The user ID is: ", userID);
  // })
  // .fail(function(error) {
  //   // Do something with the error
  // });



  // Get user id from div
  // var userID  = $("#hidden").html();




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
      document.querySelector(".message:last-of-type").scrollIntoView();
    },
    speak: function ( message ) {
      console.log( chatroomID, userID );
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
