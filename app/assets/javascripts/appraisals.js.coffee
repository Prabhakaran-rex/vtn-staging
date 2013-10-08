# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
//= require jquery.maskMoney.min
//= require jquery.carouFredSel-6.1.0-packed
//= require magiczoom
//= require chosen.jquery.min

jQuery ->
  $(".currency-input").maskMoney()
  $("#supplemental_information").collapse({toggle:false})
  $(".chzn-select").chosen()
  
  # Make sure that at least one image has been uploaded before continuing
  $('#btn_step_2_wizard_image_upload').click ->
    if $('.img-row').length is 0
      alert "Please upload at least one image to continue"
      false

  # An appraisal can have one default image
  set_as_default_image = (btn) ->
    $('.btn_make_image_primary').removeClass('btn-success')
    $('.btn_make_image_primary').html('<i class="icon-picture"></i> Mark as Primary')
    $(btn).addClass("btn-success")
    $(btn).addClass("btn-success").html('<i class="icon-picture icon-white"></i> Primary')

  if ($('#fileupload').length != 0)
    $('#fileupload').fileupload({formData: {iframe_redirect_to: vtn_constants.BASE_URI+'/result.html?%s', authenticity_token: $('meta[name="csrf-token"]').attr('content') }})

  $('#appraisal_images_table').on('click','.btn_make_image_primary', ( (event)->
    $.ajax $(this).attr("href"),
      type: 'POST'
      dataType: 'json'
      success: (data) ->
        set_as_default_image(event.target)
      error: (data) ->
        alert "Unable to set image as primary"
    false
  ))

  $('#btnSaveComment').click ->
    $('#div_comment').hide()
    $('#div_saving_comment').show()
    $.ajax ('/appraisals/comment'),
      type: 'POST'
      dataType: 'json'
      data: {comment_appraisal_id: $('#comment_appraisal_id').val(), comment: {body: $('#comment_body').val()}}
      success: (data) ->
        $('#comment_list').append('<div class="well"><h5>I wrote on ' + data.created_at +  ' :  </h5>' + data.body + '</div>')
        $('#div_comment').show()
        $('#div_saving_comment').hide()
        $('#comment_body').val("")
      error: (data) ->
        alert "Unable to save comment"
        $('#div_comment').show()
        $('#div_saving_comment').hide()
    false

  $('#btnSubmitAppraisalReply').click ->
    $('#appraisal_status').val("10")

  # Begin Code for Plan Selection in Appraisal Wizard
  $("#plansel1").click ->
    $("#planprod1").addClass("formProdOn").siblings().removeClass "formProdOn"
    $(this).addClass("formProdSelected").siblings().removeClass "formProdSelected"
    resetSelectTxt()
    $(this).html "Selected"
    $("#appraisal_selected_plan").val(vtn_constants.EAAppraisalTypeShortRestricted)

  $("#plansel2").click ->
    $("#planprod2").addClass("formProdOn").siblings().removeClass "formProdOn"
    $(this).addClass("formProdSelected").siblings().removeClass "formProdSelected"
    resetSelectTxt()
    $(this).html "Selected"
    $("#appraisal_selected_plan").val(vtn_constants.EAAppraisalTypeLongRestricted)

  $("#plansel4").click ->
    $("#planprod4").addClass("formProdOn").siblings().removeClass "formProdOn"
    $(this).addClass("formProdSelected").siblings().removeClass "formProdSelected"
    resetSelectTxt()
    $(this).html "Selected"
    $("#appraisal_selected_plan").val(vtn_constants.EAAppraisalTypeLongForSelling)

  setSelectedPlan()
  # End Code for Plan Selection in Appraisal Wizard
  $("#divRejectionReason").hide()

  $('#chkSuggestRejection').click ->
    if $(this).is(':checked')
      $("#divRejectionReason").show()
    else
      $("#divRejectionReason").hide()
      $("#txtRejectionReason").val("")

  $('#btnUpdateAppraisalReply').click ->
    if $("#chkSuggestRejection").is(':checked') and $("#txtRejectionReason").val().length == 0
      alert "Please enter a reason for rejecting the appraisal"
      false
    else
      true

  $("#chkImportAccount").change ->
    if $(this).is(':checked')
      $("#txtCardName").val($("#customer_name").val())
      $("#appraisal_payment_attributes_address").val($("#customer_address_attributes_address").val())
      $("#appraisal_payment_attributes_city").val($("#customer_address_attributes_city").val())
      $("#appraisal_payment_attributes_state").val($("#customer_address_attributes_state").val())
      $("#appraisal_payment_attributes_zip").val($("#customer_address_attributes_zip").val())
    else
      $("#txtCardName").val("")
      $("#appraisal_payment_attributes_address").val("")
      $("#appraisal_payment_attributes_city").val("")
      $("#appraisal_payment_attributes_state").val("")
      $("#appraisal_payment_attributes_zip").val("")

  $("#btnBuildWizardPhoto").click ->
    if $('.img-row').length is 0
      alert "Please upload at least one image to continue"
      false
    else
      true

  $("#btnBuildWizardGeneral").click ->
    if $("#appraisal_classification_attributes_category_id").val() is ""
      alert "Error. Please choose a category before proceeding"
      false
    else
      true

  $("#btnBuildWizardPayment").click ->
    if requiredFields()
      $("#paymentModal").modal('show')
      form = $(this).closest('form')
      $.ajax '/payments',
        type: 'POST',
        data: $(this).closest("form").serializeObject(),
        success: (data) ->
          $("#paymentModalLoading").hide()
          $("#paymentModalDeclined").html(data.message)
          $("#paymentModalDeclined").show()
          if data.status is false
            $("#paymentModalFooter").show()
          else
            setTimeout (-> form.submit()), 1000

        error: (jqXHR, textStatus, errorThrown) -> 
          $("#paymentModalLoading").hide()
          $("#paymentModalDeclined").html(textStatus+ ": " + errorThrown)
          $("#paymentModalFooter").show()
      false
    else
      alert "Please complete all required fields"
      return false

  $("#paymentModal").on "hide", ->
      $("#paymentModalLoading").show()
      $("#paymentModalDeclined").hide()
      $("#paymentModalFooter").hide()

  $("#tooltipAppraiserId").tooltip
    placement: "bottom"
    title: "If you would like this appraisal report to go to a specific appraiser please enter in their appraiser ID number. If you do not know their ID number please email support at: support@ValueThisNow.com or call the referring appraiser and ask them"

requiredFields = ->
  isValid = true
  $("[required]").each ->
    isValid = false if $(this).val() is ""
  isValid

resetSelectTxt = ->
  $("#plansel1").html "Select"
  $("#plansel2").html "Select"
  $("#plansel4").html "Select"

setSelectedPlan = ->
  if $("#appraisal_selected_plan").val()
    $("#plansel"+$("#appraisal_selected_plan").val()).trigger('click')
  else
    $("#plansel4").trigger('click')

$.fn.serializeObject = ->
  json = {}
  push_counters = {}
  patterns =
    validate  : /^[a-zA-Z][a-zA-Z0-9_]*(?:\[(?:\d*|[a-zA-Z0-9_]+)\])*$/,
    key       : /[a-zA-Z0-9_]+|(?=\[\])/g,
    push      : /^$/,
    fixed     : /^\d+$/,
    named     : /^[a-zA-Z0-9_]+$/

  @build = (base, key, value) ->
    base[key] = value
    base

  @push_counter = (key) ->
    push_counters[key] = 0 if push_counters[key] is undefined
    push_counters[key]++

  $.each $(@).serializeArray(), (i, elem) =>
    return unless patterns.validate.test(elem.name)

    keys = elem.name.match patterns.key
    merge = elem.value
    reverse_key = elem.name

    while (k = keys.pop()) isnt undefined

      if patterns.push.test k 
        re = new RegExp("\\[#{k}\\]$")
        reverse_key = reverse_key.replace re, ''
        merge = @build [], @push_counter(reverse_key), merge

      else if patterns.fixed.test k 
        merge = @build [], k, merge

      else if patterns.named.test k
        merge = @build {}, k, merge

    json = $.extend true, json, merge

  return json
