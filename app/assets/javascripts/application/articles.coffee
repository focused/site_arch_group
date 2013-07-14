$ ->
  $('.right_column.articles').on 'click tap mouseover', 'a', (e)->
    $('.right_column.articles span.tooltip:visible').hide()
    $(@).closest('li').find('span.tooltip').show()
    e.preventDefault()

  $('body').on 'mouseup tap mousemove', (e)->
    $container = $('.right_column.articles')
    $object = $container.find("span.tooltip:visible")
    App.fadeOutOthers($container, $object, e)

