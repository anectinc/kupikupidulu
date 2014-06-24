$('#media').on 'nested:fieldAdded', (event) ->
  type_field = undefined
  type_field = event.field.find('.type')
  type_field.val $(event.link).data('predefined-type')