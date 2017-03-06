$(function(){

  $(".fake-btn").on("click", function(e){
    $(".fake-div").removeClass('hidden').show(0);
    $(this).addClass('hidden');
    $(".real-submit").removeClass('hidden');
  });

});
