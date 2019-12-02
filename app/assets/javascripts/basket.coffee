
document.addEventListener "turbolinks:load", () ->

  $('.js_add_to_cart_link').on 'click', ->
    $('.js_add_to_cart_button').trigger 'click'

  $('.js_make_order_link').on 'click', ->
    $('.js_make_order_button').trigger 'click'