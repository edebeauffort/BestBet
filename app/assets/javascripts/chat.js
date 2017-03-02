$(document).ready(function(){
  var promo_id = 23; // change to your own promo id
  var baseUrl = "localhost:3000"
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
      url: baseUrl + promo_id + '/comments',
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
$("#comment-form").clear('')
  });

if (i > 0) {
 setInterval(function(event){
    $.ajax({
      type: "GET",
      url: baseUrl + promo_id + '/comments',
      success: function(data) {
        var index = 0
        data.forEach(function(object) {
          var name = data[index]["author"]
          var message = data[index]["content"]
          var newMessage  =  $('<li> ' + message +
          ' (posted <span class="date">1' + data[index]["created_at"] + '</span>) by '
          + name +'</li>')
          $('.list').append(newMessage)
          index += 1
        });
      }
    });
  }, 30);
}
});
