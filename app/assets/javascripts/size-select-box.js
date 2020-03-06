$(document).on('turbolinks:load', function(){

  function appendSizeOption(size){
    var html = `<option value="${size.id}" data-category="${size.id}">${size.name}</option>`;
    return html;
  }

  function appendSizeBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `
                        <select class="listing-select-wrapper__box--select new-main__select__product--categories" id="size" name="item[size_id]">
                          <option value="---" data-category="">選択してください</option>
                          ${insertHTML}
                        <select>
                      `;
    $('#categories-select-box').append(childSelectHtml);
  }

  $(document).on("change", "#grandchild_category", function(){
    var grandchildCategory = document.getElementById('grandchild_category').value;
    if (grandchildCategory != ""){
      $.ajax({
        type: 'GET',
        url: 'get_size',
        data: {grandchild_id: grandchildCategory},
        dataType: 'json'
      })
      .done(function(sizes){
          $('#size').remove();
          var insertHTML = '';
          sizes.forEach(function(size){
            insertHTML += appendSizeOption(size);
            console.log(insertHTML)
          });
          appendSizeBox(insertHTML);
      })
    }else{
      $('#size').remove();
    }
  })

});