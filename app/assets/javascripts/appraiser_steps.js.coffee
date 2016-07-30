# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('form').on 'click', '.remove_fields', (event) ->
		$(this).prev('div').children('.controls:first-child').children('input[type=hidden]').val('1')
		console.log($(this).parents())
		$(this).closest('fieldset').hide()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()
		$(".phone-input").mask("(999)-999-9999")

	$(".phone-input").mask("(999)-999-9999")

	$("#btn-appraiser_steps-add_references").click (event) ->
		if $(".trade-references-inputs:visible").length < 3
			alert "You must add at least 3 references"
			event.preventDefault()

	$("form[action*='/appraiser_steps/preferences']").submit (event) ->
		if ($('#customer_notify_by_sms').is(':checked') or $('#customer_notify_by_email').is(':checked')) or ($('#appraiser_notify_by_sms').is(':checked') or $('#appraiser_notify_by_email').is(':checked'))
			if not($('#accept_reimburse').is(':checked'))
				alert('Please accept to not be reimbursed to continue')
				event.preventDefault()

	$('#btn_save_bank_step').click (event) ->
		if !($("#appraiser_paypal_email").val())
			alert("Please enter an email address associated with your Paypal account to continue")
			false

	$('#btn_submit_signature').click (event) ->
		if ($("#has_signature").val() == "false")
			alert("Please upload a signature to continue")
			false


			
	