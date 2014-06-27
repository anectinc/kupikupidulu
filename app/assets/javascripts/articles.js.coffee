$('#media').on 'nested:fieldAdded', (event) ->
  type_field = event.field.find('.type')
  data = $(event.link).data('predefined-type')
  type_field.val data
  if data == 'Image'
    url_field = event.field.find('.url')
    url_field.css { display: 'none' }
  else if data == 'Video'
    file_field = event.field.find('.file')
    file_field.css { display: 'none' }
