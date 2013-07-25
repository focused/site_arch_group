$ ->
  $('.right_column.articles').on 'mousemove', 'a', (e)->
    $('.right_column.articles span.tooltip:visible').hide()
    $(@).closest('li').find('span.tooltip').show()
    # e.preventDefault()

  $('body').on 'mousemove', (e)->
    $container = $('.right_column.articles')
    $object = $container.find("span.tooltip:visible")
    Overlays.fadeOutOthers($container, $object, e)

