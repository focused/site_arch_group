window.H ||= {}

$ ->
  # open links in a new window
  $('body').on('click', '[data-new-window]', ->
    window.open($(@).attr('href'))
    false
  )

  # Submit external form.
  $('body').on('click', '[data-submit-form]', (e)->
    # console.log($(@).data('submitForm'))
    $($(@).data('submitForm')).submit()
    e.preventDefault()
  )

  # Override Rails disable_with when submitting external form.
  $('body').on('click', '[data-enable-with]', (e)->
    $(@).data('enableWith', $(@).val()).attr('data-enable-with', $(@).val())
    $(@).val($(@).data('disableWith'))
    e.preventDefault()
  )


# Call it after to show previously saved text.
H.enableSubmits = ->
  $('[data-enable-with]').each(->
    $(@).val($(@).data('enableWith'))
  )

H.fadeOutTag = ($tag, callback, remove) ->
  $tag.fadeTo("fast", 0.01, ->
    $(this).slideUp("fast", ->
      $(this).remove() if remove
    )
    callback.call() if typeof callback is "function" and callback
  )

H.fadeInTag = ($tag, callback) ->
  if typeof callback is "function" and callback
    complete = ->
      callback()
      $tag.attr('style', '')
  h = $tag.height()
  $tag.height(0)
  $tag.css('opacity', 0)
      .animate({ opacity: 1, height: h }, { queue: false, duration: "fast", complete: complete })

