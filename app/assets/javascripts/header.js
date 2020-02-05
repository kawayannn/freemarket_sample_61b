$(function(){
  $('ul.dropdown__hover-ul').hide();
  $('li.dropdown__hover').hover(function(){
    $(this).children('ul').show();
  }, function(){
    $(this).children('ul').hide();
  });
});

$(function(){
  $('ul.dropdown__category-ul').hide();
  $('li.dropdown__category').hover(function(){
    $(this).children('ul').show();
  }, function(){
    $(this).children('ul').hide();
  });
});

$(function(){
  $('ul.dropdown__items-ul').hide();
  $('li.doropdown__items').hover(function(){
    $(this).children('ul').show();
  }, function(){
    $(this).children('ul').hide();
  });
});