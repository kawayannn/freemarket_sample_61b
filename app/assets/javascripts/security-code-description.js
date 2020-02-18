$(document).on('turbolinks:load', function(){
  
  $(function(){
    $(".answer").hide();
    $('.set-question').click(function(){
      $(".answer").toggle();
    })
  });  

});