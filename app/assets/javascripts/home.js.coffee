# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#featured_coupon").modal('show')

  number = 1 + Math.floor(Math.random() * 9)
  title = ""

  switch number
    when 1
      title = "F. Scott Fitzgerald - Tender Is The Night appraised at $19,100.00"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap2.png)"
    when 2
      title = "18 Karat gold pocket watch appraised at $12,631"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap5.png)"
    when 3
      title = "Babe Ruth Autographed Ball appraised at $32,000.00"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap4.png)"
    when 4
      title = "18k white gold ladies dinner ring appraised at $3,200"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap3.png)"
    when 5
      title = "1630 world map by Hendrik Hondius appraised at $800 "
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap9.png)"
    when 6
      title = "19th c. Chinese lacquered table appraised at $1800"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap6.png)"
    when 7
      title = "1952 Topps #261 Willie Mays appraised at $3,000"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap7.png)"
    when 8
      title = "1952 Topps #407 Eddie Mathews RC appraised at $10,000"
      $("#homeItem").css "background-image", "url(https://s3.amazonaws.com/vtn.assets.valuethisnow.com/carrousel/ap8.png)"
    when 9
      title = "Chinese Ming style Meiping form vase appraised at $3,500"
      $("#homeItem").css "background-image", "url(https://www.valuethisnow.com/assets/appraise1.png)"

  $("#theTitle").html title

  $("ul.nav li.dropdown").hover (->
    $(this).find(".dropdown-menu").stop(true, true).delay(200).fadeIn()
  ), ->
    $(this).find(".dropdown-menu").stop(true, true).delay(200).fadeOut()

  $("textarea").attr('rows',4)

  $('#new_customer').submit ->
    if $('#customer_agree_to_tos').prop('checked')
      true
    else
      alert 'You should accept the Terms and Conditions to continue'
      false

  $('#new_appraiser').submit ->
    if $('#appraiser_agree_to_provider_agreement').prop('checked')
      true
    else
      alert 'You should agree to the Appraisal Provider Agreement to continue'
      false

  $('#new_appraiser').submit ->
    if $('#appraiser_agree_to_code_of_ethics').prop('checked')
      true
    else
      alert 'You should agree to the Appraiser Code of Ethics to continue'
      false
