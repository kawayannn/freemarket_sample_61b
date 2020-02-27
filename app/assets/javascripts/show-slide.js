$(document).on('turbolinks:load', function () {

  // 透明度の設定
    $("#thumbs").children('img').css("opacity", '0.4');
    $("#thumbs").children('img').eq(0).css("opacity", '1.0');
    $("#thumbs").children('img').on('mouseover', function(){
    $("#thumbs").children('img').css("opacity", '0.4');
    $(this).css('opacity', '1');
  });
});

$(function() {
  $('img.images__smn-sub').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    
    // 画像入れ替え
    $('img.images__main').stop().fadeOut(50,
    function(){
    $('img.images__main').attr('src', selectedSrc);
    $('img.images__main').stop().fadeIn(200);
    }
    );
  });
});