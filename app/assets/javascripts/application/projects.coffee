$ ->
  # Clears menu timeout when over menu and fades out others.
  $('#project_groups_menu, .projects_menu').on 'mousemove', 'ul', (e)->
    Overlays.wontHide($(@).parents('div'))
    # e.preventDefault()

  $('#project_groups_menu').on 'mousemove', '[data-overlay=switcher]', (e)->
    $ul = $(@).parent().find('ul')
    $ul.css('width', '100%') if $ul.width() - 14 < $(@).width()

  $('#projects_controller')
  .find('.right_column ul, .slide .left_arrow, .slide .right_arrow').on 'click', 'a', (e)->
    h = $('.slide').height()
    $('.slide').css('height', h)
    $('.slide .bg').fadeTo('fast', 0.01)



  $(window).resize ->
    buildProjectsMenus()
    limitBgSize()

  buildProjectsMenus()
  App.findImageBgRealSize()



buildProjectsMenus = ->
  $el = $('.projects_menu ul').each ->
    $(@).css('width', $(@).parent().width())


limitBgSize = ->
  w = $('.slide .bg').data('width')
  h = $('.slide .bg').data('height')
  ratio = w / h
  maxHeight = $(window).innerHeight() - 250

  $('.slide').css('max-width', "#{ parseInt(maxHeight * ratio) }px")
  $('.slide .bg').fadeTo('fast', 1)


App.findImageBgRealSize = ->
  $('.slide .bg').load ->
    [h, w] = [@.height, @.width]
    [actualHeight, actualWidth] = [@.height, @.width]

    $(@).data({ height: actualHeight, width: actualWidth })

    $('.slide').css('height', 'auto')
    limitBgSize()

