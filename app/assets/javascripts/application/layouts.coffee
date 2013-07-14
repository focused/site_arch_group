window.App ||= {}

$ ->
  # $('#projects_index ul li .wrap').on 'click tap', 'a', (e)->
  #   $el = $(@).find('img')
  #   visible = $el.is(":visible")
  #   unless visible
  #     $('#projects_index ul li .wrap a img').hide()
  #     $el.show()
  #   e.preventDefault()

  # #main_menu li .wrap
  # $('#main_menu li .wrap ul').hide()

  containers_to_hide = {}

  # Fades in overlays.
  $("[data-overlay*='container']").on 'click tap mouseover', "[data-overlay*='switcher']", (e)->
    $container = $(@).closest("[data-overlay*='container']")
    $container.find("[data-overlay=object]:hidden").fadeIn(100)
    e.preventDefault()

  hideOverlayObject = ($object, id)->
    $object.fadeOut(100) if containers_to_hide[id]

  # Fades out overlays.
  $('body').on 'mouseup tap mouseover', (e)->
    $container = $("[data-overlay*='container']")
    $object = $container.find("[data-overlay=object]:visible")
    if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object.length > 0
      if (id = $container.attr('id'))
        containers_to_hide[id] = true
      setTimeout(->
          hideOverlayObject($object, id)
        , 2000)



  # ----------------------------------------------------------------------------

  # Fades in project previews.
  $('#projects_index ul li').on 'click tap mouseover', 'a', (e)->
    return if $('#main_menu li .wrap [data-overlay=object]:visible').length > 0
    $('#projects_index ul li img:visible').hide()
    $(@).find("img:hidden").show()
    e.preventDefault()

  # Fades out others and clears menu timeout when over menu.
  $('#main_menu li .wrap').on 'click tap mouseover', 'a, ul', (e)->
    $container = $(@).closest('li')
    containers_to_hide[$container.attr('id')] = false
    $('#projects_index ul li img:visible').hide()

  App.fadeOutOthers = ($container, $object, e)->
    if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object
      setTimeout(->
        $object.fadeOut(100)
      , 2000)

  # Fades out all others.
  $('body').on 'mouseup tap mouseover', (e)->
    $container = $('#projects_index ul li .wrap')
    $object = $container.find("img:visible")
    App.fadeOutOthers($container, $object, e)
