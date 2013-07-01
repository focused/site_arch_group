window.App ||= {}

# App.refine_home_bg = ->
#   $el = $('#content .left_column img.bg')
#   w = $('#content .left_column').width()
#   $el.width(w)
#   $el.height(200)

$ ->
  # $(window).resize ->
    # App.refine_home_bg()

  $('#projects_index ul li .wrap').on 'click', 'a', (e)->
    $el = $(@).find('img')
    visible = $el.is(":visible")

    $('#projects_index ul li .wrap a img').hide()
    $el.show() unless visible

    e.preventDefault()


  # $('ul#projects_index li .wrap').on 'click', 'a', ->
  #   $(@).find('img').hide()

