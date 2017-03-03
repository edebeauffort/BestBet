$(function(){

  $(".fake-btn").on("click", function(e){
    $(".fake-div").removeClass('hidden');
    $(this).addClass('hidden');
    $(".real-submit").removeClass('hidden');
  });

});
