$('#price').on('change', function (e) {
  $(function(){

    const price = $('#price').val()
    const id = $('#proposer_id').val()

    $.ajax({
      url: `/proposers/${id}/finances/calculate`,
      data: { values: price,
      dataType: "json"
    }
    }).done(function(data){
      $('#tax_value').val(data.amount)
    })
  })
})

$('#finances_submit').on('click', function (e) {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

  e.preventDefault()

  const id = $('#proposer_id').val()
  const tax_value = $('#tax_value').val()

  if ($('#price').val() == ''){
    $("#price").focus()
  } else {
    $.ajax({
      url: `/proposers/${id}/finances/sync_tax`,
      method: "POST", 
      contentType: "application/json", 
      data: JSON.stringify({
        propose_id: id,
        tax_value: tax_value
      }),
      dataType: "json",
      headers: {
        'X-CSRF-Token': csrfToken
      }
    }).done(function(data) {
      window.location.href = "/";
    }).fail(function(jqXHR, textStatus, errorThrown) {
      console.error("Erro na requisição:", textStatus, errorThrown);
    });
  }
})