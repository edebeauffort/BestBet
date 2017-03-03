
$(function() {

  // $('#declarewinner').change(function(){
  //   $('.selections').hide();
  //   $('#' + $(this).val()).show();
  // });



   $('.edit_pool').submit(function() {
     $('.hiddeable').hide()
   })

   $('#admin-change-winner').click(function() {
      $('.hiddeable').show();
    });

   var output = $('#winner').text().trim();
   if (output != "") {
      $('.hiddeable').hide();
   }
});
