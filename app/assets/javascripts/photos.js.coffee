# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".btn_make_image_primary").click ->
    if $(this).hasClass('btn-success')
      $(this).removeClass('btn-sucess disabled')
    else
      $(".btn_make_image_primary").removeClass("btn-success disabled")
      $(".btn_make_image_primary").html('<i class="icon-picture"></i> Mark as Primary')
      $(this).addClass('btn-success disabled')
      $(this).html('<i class="icon-picture icon-white"></i> Primary')

  $(".btn_delete_image").click ->
    $(this).closest("tr").hide()
