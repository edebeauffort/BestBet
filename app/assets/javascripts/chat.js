$('#messages').ready(function () {
  setInterval('refresh', 1000); // Every 1 second, the `refresh` function is called.
});
 $('.send').submit('click', function(event){ // change to your own promo id
  event.preventDefault();
  var baseUrl = "localhost:3000/bets"
 $.ajax({
      type: "POST",
      url: baseUrl,
      data: post,

    });
});
//   document.getElementById("myForm").submit();
// }
