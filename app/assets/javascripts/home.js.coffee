# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#featured_coupon").modal('show')

  number = 1 + Math.floor(Math.random() * 8)
  title = ""

  switch number
    when 1
      title = "F. Scott Fitzgerald - Tender Is The Night appraised at $19,133.38"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap2.png)"
    when 2
      title = "18 carrot gold pocket watch appraised at $12,631"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap5.png)"
    when 3
      title = "Babe Ruth Autographied Ball appraised at $32,000.00"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap4.png)"
    when 4
      title = "18k white gold ladies dinner ring appraised at $3,200"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap3.png)"
    when 5
      title = "1630 world map by Hendrik Hondius appraised at $800 "
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap9.png)"
    when 6
      title = "19th c. Chinese lacquered table appraised at $1800"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap6.png)"
    when 7
      title = "1952 Topps #261 Willie Mays appraised at $3,000"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap7.png)"
    when 8
      title = "1952 Topps #407 Eddie Mathews RC appraised at $10,000"
      $("#homeItem").css "background-image", "url(http://vtn.assets.valuethisnow.com.s3.amazonaws.com/carrousel/ap9.png)"

  $("#theTitle").html title
