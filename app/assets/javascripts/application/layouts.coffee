window.App ||= {}

$ ->
  displayTopShareLinks()
  $(window).scroll displayTopShareLinks
  $(window).resize displayTopShareLinks

  # Fades in project previews.
  $('#projects_index ul li').on 'mousemove', 'a', (e)->
    return if $('#main_menu li .wrap [data-overlay=object]:visible').length > 0

    $el = $(@).find('img:hidden')
    return if $el.length == 0

    $('#projects_index ul li img:visible').hide()
    $el.show()


  # Clears menu timeout when over menu and fades out others.
  $('#main_menu li').on 'click mousemove', '.wrap', (e)->
    Overlays.wontHide($(@).closest('.submenu'))
    $('#projects_index ul li img:visible').hide()
    # e.preventDefault()

  # Fades out all others.
  $('body').on 'click mousemove', (e)->
    $container = $('#projects_index ul li .wrap')
    $object = $container.find('img:visible')
    if !$container.is(e.target) && $container.has(e.target).size() == 0 && $object.length > 0
      hideProjectPreview($object)
      # setTimeout(->
      #     hideProjectPreview($object)
      #   , 1000)
    # Overlays.fadeOutOthers($container, $object, e)


  $('body').on 'click', '.fancybox-inner', ->
    $.fancybox.close()

  App.initFancybox()


  # $('.scrollable').scrollable()

  # ----------------------------------------------------------------------------

hideProjectPreview = ($el)->
  $el.hide()

displayTopShareLinks = ->
  if $(window).scrollTop() > 35
    $("#top_share_links").hide()
  else
    $("#top_share_links").show()

App.initFancybox = ->
  $('a.fancybox').fancybox({
    padding    : 10,
    margin     : 20,
    nextEffect : 'fade',
    prevEffect : 'fade',
    helpers: {
      title: {
        type: 'over'
      }
    },
    beforeLoad: ->
      @.title = $(@.element).data('title')

  })
