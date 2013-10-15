jQuery ->
  $('#product_district').parent().hide()
  $('#product_thana').parent().hide()
  districts = $('#product_district').html()
  $('#product_division').change ->
    division = $('#product_division :selected').text()
    options = $(districts).filter("optgroup[label='#{division}']").html()
    if options
      $('#product_district').html(options)
      $('#product_district').parent().show()
    else
      $('#product_district').empty()
      $('#product_district').parent().hide()

  $('#product_thana').parent().hide()
  thanas = $('#product_thana').html()
  $('#product_district').change ->
    district = $('#product_district :selected').text()
    thana_options = $(thanas).filter("optgroup[label='#{district}']").html()
    if thana_options
      $('#product_thana').html(thana_options)
      $('#product_thana').parent().show()
    else
      $('#product_thana').empty()
      $('#product_thana').parent().hide()


jQuery ->
  $('#product-table').dataTable()
