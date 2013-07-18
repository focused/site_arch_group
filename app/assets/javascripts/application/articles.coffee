$ ->
  $('.right_column.articles').on 'mouseover', 'a', (e)->
    $('.right_column.articles span.tooltip:visible').hide()
    $(@).closest('li').find('span.tooltip').show()
    # e.preventDefault()

  $('body').on 'click', (e)->
    $container = $('.right_column.articles')
    $object = $container.find("span.tooltip:visible")
    Overlays.fadeOutOthers($container, $object, e)

