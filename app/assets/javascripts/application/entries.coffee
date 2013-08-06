$ ->
  buildColumns()

  $(window).resize ->
    buildColumns()


refineColumns = (n)->
  $('#content ul.entries').removeClass('x3 x4 x5 x6').addClass("x#{ n }")

refine3Columns = ->
  $('#content ul.entries').removeClass('x4 x5 x6').addClass('x3')

refine6Columns = ->
  $('#content ul.entries').removeClass('x3 x4 x5').addClass('x6')

buildColumns = ->
  w = $(window).width()
  switch
    when w >= 1150 && w < 1500 then refineColumns(4)
    when w >= 1500 && w < 1900 then refineColumns(5)
    when w >= 1900 then refine6Columns()
    else refine3Columns()

