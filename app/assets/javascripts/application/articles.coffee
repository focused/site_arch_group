$ ->
  # $('.right_column.articles').on 'mousemove', 'a', (e)->
  #   $('.right_column.articles span.tooltip:visible').hide()
  #   $(@).closest('li').find('span.tooltip').show()
    # e.preventDefault()

  $('body').on 'mousemove', (e)->
    $container = $('.right_column.articles ul li').not('.active')
    # $object = $container.find("span.tooltip:visible")
    # $others = $('#content .right_column.articles ul li').not('.active').find('img')
    # $others.css('opacity', 0.6)
    $object = $container.find('img')
    if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object
      $object.css('opacity', 0.6)
    # Overlays.fadeOutOthers($container, $object, e)

  $('#content .right_column.articles ul').on 'mousemove', 'img', (e)->
    $all = $('#content .right_column.articles ul li').not('.active').find('img')
    $all.css('opacity', 0.6)
    $(@).css('opacity', 1)

