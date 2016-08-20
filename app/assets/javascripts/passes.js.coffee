jQuery ->
  $('#number').parent().hide()
  numbers = $('#number').html()
  $('#pass').change ->
    pass = $('#pass :selected').text()
    options = $(numbers).filter("optgroup[label='#{pass}']").html()
    if options
      $('#number').html(options)
      $('#number').parent().show()
      $('#number').css({'width': '30%'})
      $('#pass').css({'width': '30%'})
      $('#time').css({'width': '30%'})
    else
      $('#number').empty()
      $('#number').parent().hide()
      $('#pass').css({'width': '45%'})
      $('#time').css({'width': '45%'})
