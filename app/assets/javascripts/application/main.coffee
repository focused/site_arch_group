refine_columns = (n)->
  $('#content ul.entries').removeClass('x3 x4 x5 x6').addClass("x#{ n }")

refine_3_columns = ->
  $('#content ul.entries').removeClass('x4 x5 x6').addClass('x3')

refine_6_columns = ->
  $('#content ul.entries').removeClass('x3 x4 x5').addClass('x6')

build_columns = ->
  w = $(window).width()
  switch
    when w >= 1150 && w < 1500 then refine_columns(4)
    when w >= 1500 && w < 1800 then refine_columns(5)
    when w >= 1800 then refine_6_columns()
    else refine_3_columns()


$ ->
  build_columns()

  $(window).resize ->
    build_columns()


