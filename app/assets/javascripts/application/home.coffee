Slideshow = {}

$ ->

  initSlideshow()


initSlideshow = ->
  Slideshow.current ||= $('.gallery_item.active').data('index')
  Slideshow.size = $('.gallery_item').size()
  $('.gallery_item:not(.active) img').hide().css('visibility', 'visible')
  setInterval(->
      changeSlide()
    , 15000)

changeSlide = ->
  prev_index = Slideshow.current
  Slideshow.current += 1
  Slideshow.current = 0 if Slideshow.current >= Slideshow.size

  $hiding = $(".gallery_item[data-index=#{ prev_index }] img")
  $showing = $(".gallery_item[data-index=#{ Slideshow.current }] img")

  $hiding.fadeTo(5000, 0)
  $showing.fadeTo(5000, 1)
