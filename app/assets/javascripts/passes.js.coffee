jQuery ->
  $('#number').parent().hide()
  numbers = $('#number').html()
  $('#pass').change ->
    pass = $('#pass :selected').text()
    options = $(numbers).filter("optgroup[label='#{pass}']").html()
    if options
      $('#number').html(options)
      $('#number').parent().show()
    else
      $('#number').empty()
      $('#number').parent().hide()
