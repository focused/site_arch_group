window.App ||= {}

$ ->
  $('#projects_index ul li .wrap').on 'click', 'a', (e)->
    $el = $(@).find('img')
    visible = $el.is(":visible")

    $('#projects_index ul li .wrap a img').hide()
    $el.show() unless visible

    e.preventDefault()


