jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  #This solution from http://railscasts.com/episodes/196-nested-model-form-revised
  #Does not run javascript of fields (ex: ckeditor field)

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  # this neither does work
  # $('form').on 'click', '.add_fields', (event) ->
  #   time = new Date().getTime()
  #   regexp = new RegExp($(this).data('id'), 'g')
  #   elements = $.parseHTML($(this).data('fields').replace(regexp, time), document, true)
  #   $(this).before(elements)
  #   event.preventDefault()