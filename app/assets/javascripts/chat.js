$(document).ready(function(){

var i = 0
  $('.send').on('click', function(event){
    event.preventDefault();
     var i = 0
    i += 1

    var name = $('#yourName').val()
    var message = $('#yourMessage').val()
    var newMessage  =  $('<li> ' + message +
      ' (posted <span class="date">10 minutes ago</span>) by '
      + name +'</li>')
    $('.list').append(newMessage)

    var post = JSON.stringify({
      "author": name,
      "content": message
    })


    // make a query to POST comment, sending variable post
    $.ajax({
      type: "POST",

      data: post,
      success: function(data) {
        console.log("Successfully created gist at ");
      }
    });
// setInterval(function(){
//   // empty chat
//   // write your $.get() request to fetch all comments
//  }, 3000);
console.log(i)

  });

});
