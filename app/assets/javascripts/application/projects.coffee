$ ->
  # Clears menu timeout when over menu and fades out others.
  $('#project_groups_menu, .projects_menu').on 'click tap mouseover', 'a, ul', (e)->
    Overlays.wontHide($(@).parents('div'))

  $(window).resize ->
    buildProjectsMenus()

  buildProjectsMenus()



buildProjectsMenus = ->
  $el = $('.projects_menu ul').each ->
    $(@).css('width', $(@).parent().width())
