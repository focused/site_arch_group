window.Overlays ||= {}

$ ->
  # Fades in overlays.
  $("[data-overlay*='container']").on 'click mousemove', "[data-overlay*='switcher']", (e)->
    $container = $(@).closest("[data-overlay*='container']")
    $container.find("[data-overlay=object]:hidden").fadeIn(100)
    Overlays.wontHide($container)
    e.preventDefault()

  # Fades out overlays.
  $('body').on 'click mousemove', (e)->
    $container = $("[data-overlay*='container']")
    $object = $container.find("[data-overlay=object]:visible")
    if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object.length > 0
      $container.data('overlayWillHide', true).attr('data-overlay-will-hide', true)
      setTimeout(->
          Overlays.hide()
        , 1000)


Overlays.hide = ->
  $object = $('[data-overlay-will-hide] [data-overlay=object]:visible')
  $object.fadeOut(100) if $object.length > 0

Overlays.wontHide = ($container)->
  $container.removeData('overlayWillHide').removeAttr('data-overlay-will-hide')

Overlays.fadeOutOthers = ($container, $object, e)->
  if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object
    setTimeout(->
      $object.fadeOut(100)
    , 1000)


