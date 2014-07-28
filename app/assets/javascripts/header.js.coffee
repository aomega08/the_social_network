$(document).on 'page:change', ->
  $(document).on 'click', (event) ->
    unless $(event.target).closest('.click-menu').length
      toggle = $(this)
      menu = toggle.find(".click-menu")

      if menu.is(":visible")
        toggle.removeClass('menu-open')
        menu.hide()

  $('.open-click-menu').on 'click', (event) ->
    toggle = $(this)
    menu = toggle.find(".click-menu")

    if menu.is(":visible")
      toggle.removeClass('menu-open')
      menu.hide()
    else
      toggle.addClass('menu-open')
      menu.show()

    event.stopPropagation()
