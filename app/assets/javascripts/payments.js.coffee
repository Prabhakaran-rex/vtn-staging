# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  toggle_coupon_divs = (element) ->
    $("#valid_coupon").hide()
    $("#invalid_coupon").hide()
    $("#processing_coupon").hide()
    $(element).show()

  #See how we can return a JSON object instead of an array
  calculate_discount = (price, discount, type) ->
    discount_amount = 0
    if type == "percentage"
      discount_amount = price*(discount/100)
    else if type == "fixed"
      discount_amount = discount
    [price, discount_amount, price-discount_amount]

  as_currency = (value) ->
    "$"+value

  update_totals = (amounts) ->
    $("#td_appraisal_cost").text(as_currency(amounts[0]))
    $("#td_appraisal_discount").text(as_currency(amounts[1]))
    $("#td_appraisal_total").text(as_currency(amounts[2]))

  validate_coupon = (params) ->
    $.ajax "/validate_coupon",
      type: 'POST'
      dataType: 'json'
      data: { coupon_code : $("#payment_coupon").val() }
      success: (data) ->
        toggle_coupon_divs("#valid_coupon")
        console.log data
        update_totals(calculate_discount($("#appraisal_price").val(),data.discount,data.discount_type))
      error: (data) ->
        toggle_coupon_divs("#invalid_coupon")
        update_totals(calculate_discount($("#appraisal_price").val(),0,"fixed"))

  $("#payment_coupon").keyup ->
    if $("#payment_coupon").val().length != 16
      toggle_coupon_divs()
      update_totals(calculate_discount($("#appraisal_price").val(),0,"fixed"))
      return false
    else
      validate_coupon()

  toggle_coupon_divs()
