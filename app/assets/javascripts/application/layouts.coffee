window.App ||= {}

$ ->
  # Fades in project previews.
  $('#projects_index ul li').on 'mousemove', 'a', (e)->
    return if $('#main_menu li .wrap [data-overlay=object]:visible').length > 0
    $('#projects_index ul li img:visible').hide()
    $el = $(@).find("img:hidden")
    $el.show()
    setTimeout(->
        hideProjectPreview($el)
      , 1000)

  # Clears menu timeout when over menu and fades out others.
  $('#main_menu li').on 'click mousemove', '.wrap', (e)->
    Overlays.wontHide($(@).closest('.submenu'))
    $('#projects_index ul li img:visible').hide()
    # e.preventDefault()

  # Fades out all others.
  # $('body').on 'click', (e)->
  #   $container = $('#projects_index ul li .wrap')
  #   $object = $container.find("img:visible")
  #   Overlays.fadeOutOthers($container, $object, e)

  $('a.fancybox').fancybox()

  # ----------------------------------------------------------------------------

hideProjectPreview = ($el)->
  $el.hide()

