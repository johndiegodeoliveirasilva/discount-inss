$('#price').on('change', function (e) {
  $(function(){
    const price = $('#price').val()
    const propose_id = $('#proposer_id').val()

    $.ajax({
      url: `/proposers/${propose_id}/finances/calculate`,
      data: { values: price,
      dataType: "json"
    }
    }).done(function(data){
      $('#tax_value').val(data.amount)
      $('#tax_value').maskMoney({
        prefix: 'R$ ',
        thousands: '.',
        decimal: ',',
        allowZero: true
      })
      
      const tax_value = Number($('#tax_value').val().replace('R$ ', '').replace('.', '').replace(',', '.'))
      const price = Number($('#price').val().replace('R$ ', '').replace('.', '').replace(', ', '.'))
      
      if (tax_value < price) {
        const new_income = price - tax_value
        $('#new_price').val(new_income)
      }
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