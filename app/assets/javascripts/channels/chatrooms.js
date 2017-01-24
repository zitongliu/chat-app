App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function () {},
  disconnected: function () {},
  received: function (data) {
    $('#test-chatroom').append( data.message );
  },
  speak: function ( message ) {
    this.perform( 'speak', {
      message: message
    });
  }
});

// App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
//   connected: ->
//     # Called when the subscription is ready for use on the server
//
//   disconnected: ->
//     # Called when the subscription has been terminated by the server
//
//   received: (data) ->
//     # Called when there's incoming data on the websocket for this channel
//     $('#test-chatroom').append data['message']
//
//   speak: (message) ->
//     @perform 'speak', message: message


$(document).on('keypress', '.socket-input', function (event) {
  if (event.keyCode === 13) {
    App.chatrooms.speak( event.target.value );
    event.target.value = '';
    event.preventDefault();
  }
});
