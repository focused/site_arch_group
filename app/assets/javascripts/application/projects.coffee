$ ->
  # Clears menu timeout when over menu and fades out others.
  $('#project_groups_menu, .projects_menu').on 'mousemove', 'ul', (e)->
    Overlays.wontHide($(@).parents('div'))
    # e.preventDefault()

  $('#projects_controller #content .right_column ul').on 'click', 'li', (e)->
    $(@).parent().find('li.active').removeClass('active')
    $(@).addClass('active')

    $main = $('.left_column img.bg')
    $link = $('.left_column a.fancybox')

    $main.fadeTo('fast', 0.01, =>
      $main.attr('src', $(@).data('src')) #if $(@).data('src')
      $link.attr('href', $(@).data('full')) #if $(@).data('full')

      $main.css('opacity', '0.01').css('display', 'block')
      $main.animate({ opacity: 1 }, { queue: false, duration: 'fast' })
    )



  $(window).resize ->
    buildProjectsMenus()

  buildProjectsMenus()



buildProjectsMenus = ->
  $el = $('.projects_menu ul').each ->
    $(@).css('width', $(@).parent().width())

