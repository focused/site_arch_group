window.App ||= {}

App.refine_home_bg = ->
  $el = $('#content .left_column img.bg')
  new_height = $el.width() / 1.5
  $el.attr('height', new_height)

$ ->
  $(window).resize ->
    App.refine_home_bg()
