$(function() {
  $('#declarewinner').change(function(){
    $('.selections').hide();
    $('#' + $(this).val()).show();
  });
});
