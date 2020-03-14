$(document).on('turbolinks:load', function(){
  Payjp.setPublicKey('pk_test_0a5c670b1657138aa929d4b9');
  const btn = document.getElementById('add-card-btn');
  
  btn.addEventListener("click", (e) => {
    e.preventDefault();
    $(function(){
      form = $("#chargeForm")
      const card = {
        number: document.getElementById('card-num-input').value,
        exp_month: document.getElementById("month-select").value,
        exp_year: `20${document.getElementById("year-select").value}`,
        cvc: document.getElementById('security-code-input').value
      }

      Payjp.createToken(card, function(s, response){
        var token = response.id;
        form.append($('<input class="payjp-token" name="payjp_token" type="hidden" />').val(token));
        console.log(form.append($('<input type="hidden" name="payjpToken" />').val(token)));
        console.log(token);
        form.submit();
      })
    });
  });
});
