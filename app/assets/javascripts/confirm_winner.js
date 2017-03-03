
$(function() {

  $('#declarewinner').change(function(){
    $('.selections').hide();
    $('#' + $(this).val()).show();
  });

   var output = $('#winner').text();
   if (output.length != 0) {
      $('.hiddeable').addClass('hidden');
   }

   $('#admin-change-winner').click(function() {
      $('.hiddeable').removeClass('hidden');
    });
});
