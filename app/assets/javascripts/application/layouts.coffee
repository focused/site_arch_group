window.App ||= {}

$ ->
  # Fades in project previews.
  $('#projects_index ul li').on 'click tap mouseover', 'a', (e)->
    return if $('#main_menu li .wrap [data-overlay=object]:visible').length > 0
    $('#projects_index ul li img:visible').hide()
    $(@).find("img:hidden").show()
    e.preventDefault()

  # Clears menu timeout when over menu and fades out others.
  $('#main_menu li .wrap').on 'click tap mouseover', 'a, ul', (e)->
    Overlays.wontHide($(@).closest('.submenu'))
    $('#projects_index ul li img:visible').hide()

  # Fades out all others.
  $('body').on 'mouseup tap mouseover', (e)->
    $container = $('#projects_index ul li .wrap')
    $object = $container.find("img:visible")
    Overlays.fadeOutOthers($container, $object, e)

  # ----------------------------------------------------------------------------



