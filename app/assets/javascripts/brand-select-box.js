$(document).on('turbolinks:load', function(){

  function buildBrandList(result){
    var html = `
                <li class="add-brand" data-brand-id="${result.id}" data-brand-name="${result.name}">
                  ${result.name}
                </li>
              `
    $("#brand-search-result").append(html);
}


  function buildHiddemInputBrand(brandId){
    var html = `
                  <input type="hidden" name="item[brand_id]" value="${brandId}">
                `
    $("#brand-search-result").append(html);
  }

  $("#brand-search-field").on("keyup", function(){
    var input = $("#brand-search-field").val();
    $.ajax({
      type: 'GET',
      url: 'get_brand',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(results){
      console.log('ok')
      $("#brand-search-result").empty();
      if (results.length !== 0) {
        results.forEach(function(result){
          buildBrandList(result);
        });
      }
      else{
      }
    })
  });

  $(document).on("click", ".add-brand", function() {
    const brandName = $(this).attr("data-brand-name");
    const brandId = $(this).attr("data-brand-id");
    $("#brand-search-result").empty();
    buildHiddemInputBrand(brandId)
    $('#brand-search-field').val(brandName);
  });
});