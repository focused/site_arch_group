$ ->
  # Clears menu timeout when over menu and fades out others.
  $('#project_groups_menu, .projects_menu').on 'mousemove', 'ul', (e)->
    Overlays.wontHide($(@).parents('div'))
    # e.preventDefault()

  $('#projects_controller #content .right_column ul').on 'click', 'li', (e)->
    $(@).parent().find('li.active').removeClass('active')
    $(@).addClass('active')

    $img = $('.slide .bg')
    # $link = $('.left_column a.fancybox')

    $img.fadeTo('fast', 0.01)
    # $main.fadeTo('fast', 0.01, =>
      # $main.attr('src', $(@).data('src')) #if $(@).data('src')
      # $link.attr('href', $(@).data('full')) #if $(@).data('full')

      # $main.css('opacity', '0.01').css('display', 'block')
      # $main.animate({ opacity: 1 }, { queue: false, duration: 'fast' })
    # )


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

    limitBgSize()

