# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  toggle_coupon_divs = (element) ->
    $("#valid_coupon").hide()
    $("#invalid_coupon").hide()
    $("#processing_coupon").hide()
    $(element).show()

  set_coupon_badge = (status) ->
    switch status
      when 'error'
        css_style = 'danger'
        css_icon = 'remove'
        text = 'Invalid Coupon'
      when 'success'
        css_style = 'success'
        css_icon = 'ok'
        text = 'Valid Coupon'
      when 'processing'
        css_style = 'info'
        css_icon = 'time'
        text = 'Validating coupon'
    $("#payment-coupon-div .help-block").html('<span class="label label-'+ css_style + '"><span class="glyphicon glyphicon-' + css_icon+'"></span> '+text+'</span>')

  clear_coupon_badge = (element) ->
      $("#payment-coupon-div .help-block").html('')

  #See how we can return a JSON object instead of an array
  calculate_discount = (price, discount, type) ->
    if discount is 0
      ret = [price, 0, price]
    else
      ret = [price, price-discount, discount]
    ret

  as_currency = (value) ->
    "$" + parseFloat(value, 10).toFixed(2)

  update_totals = (amounts) ->
    $("#td_appraisal_cost").text(as_currency(amounts[0]))
    $("#td_appraisal_discount").text(as_currency(amounts[1]))
    $("#td_appraisal_total").text(as_currency(amounts[2]))

  validate_coupon = (params) ->
    $.ajax "/validate_coupon",
      type: 'GET'
      dataType: 'json'
      data: { 
        coupon_code : $("#appraisal_payment_attributes_coupon").val(), 
        appraisal_type: $("#appraisal_type").val(), 
        customer_id: $("#customer_id").val()
        is_xw: $("#processXW").is(":checked")
      }
      success: (data) ->
        set_coupon_badge('success')
        update_totals(calculate_discount($("#appraisal_price").val(),data.discount,data.discount_type))
      error: (data) ->
        set_coupon_badge('error')
        update_totals(calculate_discount($("#appraisal_price").val(),0,"fixed"))

  $("#appraisal_payment_attributes_coupon").keyup ->
    if $("#appraisal_payment_attributes_coupon").val().length != 16
      clear_coupon_badge()
      update_totals(calculate_discount($("#appraisal_price").val(),0,"fixed"))
      return false
    else
      set_coupon_badge('processing')
      validate_coupon()

  clear_coupon_badge()
  $("#appraisal_payment_attributes_coupon").keyup()

  $("#processXW").change ->
    if $("#appraisal_payment_attributes_coupon").val().length != 16
      clear_coupon_badge()
      update_totals(calculate_discount($("#appraisal_price").val(),0,"fixed"))
      return false
    else
      set_coupon_badge('processing')
      validate_coupon()
