# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#btn_export_1099").click (event) ->
    a_href = $(this).attr('href')
    key = $("#txt_tax_code").val()
    $(this).attr('href',a_href+"?code="+key)
