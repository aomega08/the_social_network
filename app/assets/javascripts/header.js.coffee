$ ->
  $(document).on 'click', (event) ->
    unless $(event.target).closest('#header-arrow-menu').length
      if $('#header-arrow-menu').is(":visible")
        $('.open-header-menu-icon').removeClass('menu-open')
        $('#header-arrow-menu').hide()

  $('.open-header-menu').on 'click', (event) ->
    if $('#header-arrow-menu').is(":visible")
      $('.open-header-menu-icon').removeClass('menu-open')
      $('#header-arrow-menu').hide()
    else
      $('.open-header-menu-icon').addClass('menu-open')
      $('#header-arrow-menu').show()
    event.stopPropagation()
