window.App ||= {}

# App.refine_home_bg = ->
#   $el = $('#content .left_column img.bg')
#   w = $('#content .left_column').width()
#   $el.width(w)
#   $el.height(200)

$ ->
  $(window).resize ->
    # App.refine_home_bg()

  $('ul#projects_index li .wrap').on('mouseover', 'a', ->
    $(@).find('img').show()
  )

  $('ul#projects_index li .wrap').on('mouseout', 'a', ->
    $(@).find('img').hide()
  )
