$(function(){

  $(".fake-btn").on("click", function(e){
    $(".fake-div").removeClass('hidden');
    $(this).addClass('hidden');
    $(".real-submit").removeClass('hidden');
  });
});


// <!-- Choose a selection effect -->
$(".bet-selection").click(function(){
  $(".bet-selection").removeClass("active");
  $(this).toggleClass("active");
  $(".confirmbutton").addClass("active");
});

$("#pool-<%=@pool.id%>")
  .countdown("<%= @pool.end_date %>", function(event) {
    $(this).text(
      event.strftime('%Dd %H:%M:%S')
      );
    $(this).on('finish.countdown', function(){
      $("#pool-<%=@pool.id%>").html("Bet closed").addClass("finish");
      $(".bet-selections").click(function(){
        $("#pool-<%=@pool.id%>").effect( "shake", {times:4}, 600 );
      $(".bet-selection").click(function(){
        $(".bet-selection").removeClass("active");
        $(".confirmbutton").removeClass("active");
      });
      });
      return false;
    });
  })
