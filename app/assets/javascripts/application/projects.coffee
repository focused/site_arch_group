$ ->
  # Clears menu timeout when over menu and fades out others.
  $('#project_groups_menu, .projects_menu').on 'click', 'ul', (e)->
    Overlays.wontHide($(@).parents('div'))
    # e.preventDefault()

  $(window).resize ->
    buildProjectsMenus()

  buildProjectsMenus()



buildProjectsMenus = ->
  $el = $('.projects_menu ul').each ->
    $(@).css('width', $(@).parent().width())
