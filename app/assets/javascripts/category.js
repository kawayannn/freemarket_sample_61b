$(document).on('turbolinks:load', function(){
  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `
                          <select class="listing-select-wrapper__box--select new-main__select__product--categories" id="child_category">
                            <option value="---" data-category="">選択してください</option>
                            ${insertHTML}
                          <select>
                        `;
      $('#categories-select-box').append(childSelectHtml);
    }

    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `
                                <select class="listing-select-wrapper__box--select new-main__select__product--categories" id="grandchild_category" name="item[category_id]">
                                  <option value="" data-category="選択してください">---</option>
                                  ${insertHTML}
                                </select>
                              `;
      $('#categories-select-box').append(grandchildSelectHtml);
    }

    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value;
      if (parentCategory != ""){
        $('#size').remove();
        $('#child_category').remove();
        $('#grandchild_category').remove(); 
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_id: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#child_category').remove();
          $('#size').remove();
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#child_category').remove();
        $('#grandchild_category').remove(); 
        $('#size').remove();
      }
    });
    $(document).on("change", "#child_category", function() {
      var childId = $('#child_category option:selected').data('category');
      if (childId != ""){
        $.ajax({
          url: 'get_category_grandchildren',
          type: 'GET',
          data: { child_id: childId },
          dataType: 'json'
        })
        .done(function(grandchildren){
            console.log('ok')
            $('#grandchild_category').remove();
            $('#size').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#grandchild_category').remove();
      }
    });

  });
});